select
  cus.CustomerId,
  upper(cus.name) as FullName,
  upper(split_part(cus.name, ' ', 1)) as FirstName,
  upper(split_part(cus.name, ' ', 2)) as LastName,
  '(' || substr(cus.Phone, 3, 3) || ')' || ' ' || substr(cus.Phone, 7, 9) as PhoneNumber,
  cus.Email as EmailAddress,
  cus.Address,
  cus.Region,
  cus.PostalZip,
  cus.Country
from {{ ref('raw_customers') }} as cus
