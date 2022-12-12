CREATE PROCEDURE dbo.StoredProcedureName
    @idUser NVARCHAR(128),
    @role int
AS
BEGIN
    DECLARE @email NVARCHAR(256)
    SELECT @email = Email FROM [dbo].[AspNetUsers] as U
    WHERE U.Id = @idUser
    IF (@role = 1)
    BEGIN
        DECLARE @lastMSSV int
        select @lastMSSV = max(MSSV) from [dbo].[SinhVien]
        -- Thêm sinh viên
        INSERT INTO [dbo].[SinhVien]
        (account_ID, MSSV)
        VALUES
        (@idUser, @lastMSSV + 1)
    END
    ELSE
    BEGIN
        DECLARE @lastMSGV int
        select @lastMSGV = max(maGiangVien) from [dbo].[GiangVien]
        -- Thêm sinh viên
        INSERT INTO [dbo].[GiangVien]
        (account_ID, maGiangVien)
        VALUES
        (@idUser, @lastMSGV + 1)
    END

    INSERT INTO [dbo].[AspNetUserRoles]
    VALUES (@idUser, @role)
END