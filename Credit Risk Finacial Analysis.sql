select * from Expense;
select * from Customer;
select * from Loan;
select * from Account;
select * from Repayment;
Select * from Transactions;

select * from INFORMATION_SCHEMA.columns
where TABLE_NAME = 'Customer';

--CUSTOMER INSIGHTS--

--Customer with no transaction in the last 6 Months--
Select CONCAT(c.FirstName,' ', c.LastName)as FullName,c.CustomerID,c.Gender,c.Status,c.RegistrationDate
from Customer c
where c.CustomerID not in (select distinct a.customerid from Account a
left join Transactions t
on a.AccountID = t.AccountID
where t.TransactionDate >= DATEADD(MM, -6, GETDATE())
);
With LastTransaction as (
select a.CustomerID, MAX(T.TransactionDate) as LastTransact
from Account a
join Transactions T
ON a.AccountID = T.TransactionID
Group by a.CustomerID)
Select CONCAT(c.FirstName,' ', c.LastName)as FullName,c.CustomerID,c.Gender,a.accountStatus,T.TransactionDate,
DATEDIFF(MM,t.TransactionDate,GETDATE()) as TransactMonth,
case when t.TransactionDate is null then 'NeverTransacted'
when datediff(MM,T.TransactionDate, GETDATE()) between 6 and 12 then 'Inactive Months'
when DATEDIFF(MM,T.TransactionDate, GETDATE()) between 12 and 13 then 'Inactive Year'
else 'Inactive Two Years'
end as YearCriterion
from Customer c
left join Account a
on c.CustomerID = a.CustomerID
left JOIN Transactions T
on t.AccountID = a.AccountID
where t.transactiondate < DATEADD(MM, -6, GETDATE())
ORDER by TransactMonth desc;

--Top 10 highest value Customers by Total Amount--
select * from Customer;
select * from Account;
select * from Transactions;
select Top 10 C.CustomerID,CONCAT(c.firstname,' ',c.lastname) as FullName,
Round(sum(t.amount),2) as SumTotal
from Customer c
join account a
on c.CustomerID = a.CustomerID
left join Transactions t
on a.AccountID = t.AccountID
group by CONCAT(c.firstname,' ',c.lastname),c.CustomerID
order by SumTotal Desc;


--Customer retention rate year over year---

--Customers with both loan and savings account---
select * from Customer;
select * from Account;
Select * from Loan;
Select c.FirstName,c.LastName,a.CustomerID,a.accounttype,l.loanid
from Customer c
left join Account a
on c.CustomerID = a.CustomerID
inner join loan l
on l.CustomerID = a.CustomerID
where AccountType = 'savings'
and LoanID is not null;


--Occupation with the highest loan default rate--

Select c.occupation,COUNT(case when l.loanstatus = 'Defaulted' then 1 end) * 100 /
count(*) as DefaultRate
from Customer c
inner join loan l
on c.CustomerID = l.CustomerID
group by c.Occupation
order by DefaultRate desc;
select * from Loan;

---Customer with the highest loan---
select Top 1 concat(f.firstname,' ', f.lastname) as FullName, F.CustomerID,
round(sum(l.loanamount-r.amountpaid),1,1) as Amount
from customer f
inner join loan l
on f.CustomerID = l.CustomerID
inner join Repayment r
on r.LoanID = l.LoanID
group by concat(f.firstname,' ', f.lastname),f.CustomerID
order by Amount desc;

---Account Insight---
--Account with zero balance (Dormant Account)--
select * from Account;
select * from Account
where balance = 0 ;

--Average account balance by account type--
select AccountType, Round(avg(Balance),2) as AverageAccountBalance from Account
group by AccountType 
order by AverageAccountBalance desc;

--Account opened per month--
select Year(opendate) as Yearr,Datename(month,OpenDate) as OpenMonth,
count(accountID) as AccountOpened from Account
group by Year(OpenDate),datename(Month,OpenDate)
order by AccountOpened desc;

--Top ten accounts by transaction volume---
select * from Account;
select * from Transactions;
select top 10 a.accountid,round(sum(t.amount),2) TotalAmount
from Account a
left join Transactions t
on a.AccountID = t.AccountID
group by a.AccountID
order by TotalAmount desc;

---Transaction Insight---
---Total transaction Volume by channel--
select Transactiontype,count(*) CountofType, round(sum(Amount),2) as VolumeofTransaction from Transactions
group by TransactionType
order by VolumeofTransaction desc;


--Peak Transaction days of the week--
select * from Transactions;
select datename(WEEKDAY,transactionDate) as WeekDays,
count(TransactionID),round(sum(amount),2)as TotalSum
from Transactions
group by datename(WEEKDAY,transactionDate)
order by TotalSum desc;


--Average transaction amount by account type--
select * from Account;
select * from Transactions;
select a.accounttype,round(avg(t.Amount),2) as AverageAmount
from account a
left join Transactions t
on a.AccountID = t.AccountID
group by a.AccountType
order by AverageAmount Desc;

--failed vs succesfull transaction rate--
select Status, count(*)as StatusL from Transactions
group by status
order by StatusL desc;

--Top 10 highest single transactions--
select top 10 TransactionId,TransactionDate,Round(sum(Amount),2) as Totall
from Transactions
group by TransactionId,TransactionDate
order by Totall desc;
 select * from Transactions
 where TransactionID = 'TXN000834';

 ---Loan Insights--

--Total number of customers and loans--
select distinct count(customerid) as TotalCustomers, count (Loanid) as TotalLoans
from Loan;

--Loan Amount by region--
Select * from Loan;
select * from Customer;
Select c.Region,Round(Sum(l.LoanAmount),2) as TotalLoanAmount
from Customer c
inner join loan l
on c.CustomerID = l.CustomerID
group by c.Region
order by TotalLoanAmount desc;

--Average loan amount by occupation--
 select * from Loan;
 select * from Customer;
 select c.Occupation, Round(AVG(l.LoanAmount),2) as AverageAmount
 from Customer c
 left join Loan l
 on c.CustomerID = l.CustomerID
 group by c.Occupation
 order by AverageAmount desc;

--loans maturing in the next 3 months--
 Select year(MaturityDate) as Year,DATENAME(Month,MaturityDate) as Month
 from Loan
 where maturitydate between GETDATE() and  DATEADD(MM,3,GETDATE());

--Interest revenue generated per loan type--
 select * from Loan;
 select LoanType,Round(sum(interestRate),2) as TotalInterest from loan
 group by LoanType
 order by TotalInterest Desc;

--collateral type distribution accross loans--
 select CollateralType,Round(Sum(LoanAmount),2) as SumAmount
 from Loan
 group by CollateralType
 order by SumAmount desc;

 --Total Loan Disbursed--
 select * from loan;
 select round(sum(loanamount),2) TotalLoanAmount from loan;

 --Average Loan Disbursed--
 select round(AVG(loanamount),2) AverageLoanAmount from Loan;

 --Non performing Loan--
select round(sum(loanamount),2) as TotalNPL
from loan 
where loanstatus = 'defaulted';



---Repayments Insight--

 --Customers with three or more consecutive missed repayment--
 SELECT * FROM Repayment;
 with MissedRepayment as(
 select l.customerid,l.LoanID, r.RepaymentStatus,r.repaymentdate,
 ROW_NUMBER() over(partition by l.customerID Order by r.RepaymentDate) -
 Row_number() over(partition by l.customerID,r.Repaymentstatus order by r.repaymentDate) as Grp
 from Repayment r
 inner join loan l
 on r.LoanID = l.LoanID
 where RepaymentStatus = 'missed')
 select customerID,count(*) as MissedRepayment
 from missedrepayment
 group by customerID,Grp
 having count(*) >=3;


--Average penalty charged per loan type--
 Select l.loanType, round(avg(penaltycharged),2) as Average
 from loan l
 inner join Repayment r
 on l.LoanID = r.LoanID
 group by l.LoanType
 order by Average desc;

--Total Penalties collected per month--
 select * from Repayment;
 select DATENAME(month,RepaymentDate) as Month, Round(sum(penaltyCharged),2) as SumPenalty
 from Repayment
 group by DATENAME(month,RepaymentDate)
 order by SumPenalty desc;

--Repayment paid by region--
 select * from Repayment;
 select * from Customer;
 select * from Loan;

 select c.Region,round(sum(r.AmountPaid),2)as sumAmount
 from Customer c
 inner join Loan l
 on c.CustomerID = l.CustomerID
 inner join Repayment r
 on l.LoanID = r.LoanID
 group by c.Region
 order by sumAmount desc;


 --Expenses Insights---
 --Top three highest expense categories per year--
 select * from Expense;
 select top 3 category,Year(expensedate)Year, (Round(sum(amount),1)) as TotalAmount from Expense
 group by category,Year(expensedate)
 order by TotalAmount desc;

 --Budget Utilization by Dept---
 select department,count(expenseid)TotalCount, round(sum(amount),1) as TotalAmount
 from Expense
 group by Department
 order by TotalAmount desc;

 --Quarter over Quarter expense comparison--
Select year(expensedate) as Year, DATEPART(Quarter,expensedate) as Quarter,
round(sum(amount),1) as TotalExpenses from Expense
group by year(expensedate),DATEPART(Quarter,expensedate)
order by TotalExpenses desc;
 
 --Expense distribution by payment mode--
 select paymentmode,count(ExpenseID) as TotalTransact, Round(sum(Amount),1) as TotalExpense
 from Expense
 group by PaymentMode
 order by TotalExpense desc;

