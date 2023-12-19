create table tblProduct(
ProductID int not null primary key,
Name varchar(20),
UnitPrice int,
QtyAvailable int)

create table tblProductSales(
ProductSalesID int primary key,
ProductID int,
QuantitySold int,
foreign key(ProductID) references tblProduct(ProductID))

insert into tblProduct values (1,'Laptops',2340,100),(2,'Desktops',3467,80);

delete from tblProduct;
delete from tblProductSales




--creating a SP to sell the product

ALTER PROCEDURE spSellProduct
@ProductID int,
@QtyToSell int
AS
BEGIN
	--check the stock available for the product we want to sell
	DECLARE @StockAvailable int
	SELECT @StockAvailable=QtyAvailable
	FROM tblProduct WHERE ProductID=@ProductID

	--Throw an error if enough stock is not avilable
	if(@StockAvailable < @QtyToSell)
	BEGIN
		RAISERROR('Enough stock not avilable',16,1)
	END
	
	--If enough stock is available
	ELSE
	BEGIN
		BEGIN TRAN
		-- First reduce the QtyAvailable in tblProduct
		UPDATE tblProduct
		SET QtyAvailable = (QtyAvailable - @QtyToSell)
		WHERE ProductID = @ProductID

		-- Add the record in tblProductSales
		DECLARE @MaxProductSalesID int
		--calculate  MAX productSlesID
		SELECT @MaxProductSalesID = CASE
									WHEN MAX(ProductSalesID) IS NULL THEN 0
									ELSE MAX(ProductSalesID)
									END
									FROM tblProductSales
		--Increment @MaxProductSalesID by 1,to avoid PK violation
		SET @MaxProductSalesID =@MaxProductSalesID + 1
		INSERT INTO tblProductSales values(@MaxProductSalesID,@ProductID,@QtyToSell)
		IF(@@ERROR <> 0)
		BEGIN
			ROLLBACK TRANSACTION
			PRINT 'Transaction rolled back.'
		END
		ELSE
		BEGIN
			COMMIT TRAN
			PRINT 'Transaction committed.'
		END
	END
END

execute spSellProduct 1,10
select * from tblProduct;
select * from tblProductSales;

-------------------------------------------using try catch block----------------------------

ALTER PROCEDURE spSellProductUsingTryCatch
@ProductID int,
@QtyToSell int
AS
BEGIN
	--check the stock available for the product we want to sell
	DECLARE @StockAvailable int
	SELECT @StockAvailable=QtyAvailable
	FROM tblProduct WHERE ProductID=@ProductID

	--Throw an error if enough stock is not avilable
	if(@StockAvailable < @QtyToSell)
	BEGIN
		RAISERROR('Enough stock not avilable',16,1)
	END
	
	--If enough stock is available
	ELSE
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
			-- First reduce the QtyAvailable in tblProduct
			UPDATE tblProduct
			SET QtyAvailable = (QtyAvailable - @QtyToSell)
			WHERE ProductID = @ProductID

			-- Add the record in tblProductSales
			DECLARE @MaxProductSalesID int
			--calculate  MAX productSlesID
			SELECT @MaxProductSalesID = CASE
										WHEN MAX(ProductSalesID) IS NULL THEN 0
										ELSE MAX(ProductSalesID)
										END
										FROM tblProductSales
			--Increment @MaxProductSalesID by 1,to avoid PK violation
			--SET @MaxProductSalesID =@MaxProductSalesID + 1
			INSERT INTO tblProductSales values(@MaxProductSalesID,@ProductID,@QtyToSell)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			SELECT
				ERROR_NUMBER() as ErrorNumber,
				ERROR_MESSAGE() as Errormessage,
				ERROR_PROCEDURE() as ErrorProcedure,
				ERROR_STATE() as ErrorState,
				ERROR_SEVERITY() as ErrorSeverity,
				ERROR_LINE() as ErrorLine
		END CATCH
	END
END

--executing the procedure
execute spSellProductUsingTryCatch 2,10