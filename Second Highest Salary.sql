select 
  if(
      count(distinct(salary)) > 1 , 
      (
      select salary from
      (select distinct(salary) 
      from employee
      order by salary desc
      limit 2 
      )x
      order by x.salary
      limit 1
       ) , 
      null
    ) as SecondHighestSalary
  from employee
