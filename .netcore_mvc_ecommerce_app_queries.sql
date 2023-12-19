CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(50) NOT NULL,
	ProductDescription NVARCHAR(max) NOT NULL,
	Price DECIMAL NOT NULL,
    CategoryID INT NOT NULL,
    CONSTRAINT fk_CategoryID
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
    ON DELETE CASCADE
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL
);

drop table Products
insert into Categories values('Electronics');
insert into Categories values('Clothing');
insert into Categories values('Home and Kitchen');
select * from Categories;
select * from Products

insert into Products values('Smartphone','Latest smartphone with advanced features',499.99,1);
insert into Products values('Laptop','Powerful laptop for professional use',1299.99,1);
insert into Products values('T-Shirt','Comfortable cotton T-shirt',19.99,2);
insert into Products values('Cookware Set','High-quality cookware for your kitchen',89.99,3);


CREATE TABLE CartItem (
    CartItemId nvarchar(50) PRIMARY KEY,
	CartId nvarchar(50) NOT NULL,
    ProductId INT NOT NULL,
    ProductName NVARCHAR(50) NOT NULL,
    Price DECIMAL(18, 2) NOT NULL,
    ProductDescription NVARCHAR(MAX) NOT NULL,
    Quantity INT NOT NULL,
    CategoryId INT NOT NULL,
	FOREIGN KEY (CartId) REFERENCES Cart(CartId)
);

--currently using
CREATE TABLE CartItem
(
    CartItemId NVARCHAR(50) PRIMARY KEY,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    UserId NVARCHAR(50) FOREIGN KEY REFERENCES Users(UserId),
    Price DECIMAL NOT NULL,
    ProductName NVARCHAR(MAX) NOT NULL,
    ProductDescription NVARCHAR(MAX),
    CategoryId INT   
);
-- Table for ApplicationUser
CREATE TABLE Users(
    UserId NVARCHAR(50) PRIMARY KEY,
    Email NVARCHAR(50) NOT NULL,
    Password NVARCHAR(MAX) NOT NULL,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100)
);

drop table CartItem;

CREATE TABLE Cart
(
CartId nvarchar(50) primary key not null,
UserId NVARCHAR(50) NOT NULL,
FOREIGN KEY (UserId) REFERENCES Users(UserId)
)