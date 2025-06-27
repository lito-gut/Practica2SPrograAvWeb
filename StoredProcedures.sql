CREATE PROCEDURE sp_InsertarVendedor
    @Cedula NVARCHAR(50),
    @Nombre NVARCHAR(100),
    @Correo NVARCHAR(100),
	@Estado BIT
AS
BEGIN
    INSERT INTO Vendedores (Cedula, Nombre, Correo, Estado)
    VALUES (@Cedula, @Nombre, @Correo, @Estado)
END
GO

CREATE PROCEDURE sp_InsertarVehiculo
    @Marca NVARCHAR(100),
    @Modelo NVARCHAR(100),
    @Color NVARCHAR(50),
    @Precio DECIMAL(18, 2),
    @IdVendedor BIGINT
AS
BEGIN
    INSERT INTO Vehiculos (Marca, Modelo, Color, Precio, IdVendedor)
    VALUES (@Marca, @Modelo, @Color, @Precio, @IdVendedor)
END
GO


CREATE PROCEDURE sp_ConsultarVehiculos
AS
BEGIN
    SELECT 
        v.Marca,
        v.Modelo,
        v.Precio,
        ve.Cedula,
        ve.Nombre
    FROM Vehiculos v
    INNER JOIN Vendedores ve ON ve.IdVendedor = v.IdVendedor
END
GO

CREATE PROCEDURE sp_ContarVehiculosPorMarca
    @Marca NVARCHAR(100)
AS
BEGIN
    SELECT COUNT(*) AS Cantidad
    FROM Vehiculos
    WHERE Marca = @Marca
END
GO