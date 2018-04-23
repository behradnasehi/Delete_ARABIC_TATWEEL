/*
select mis.Delete_ARABIC_TATWEEL(N'حقيقت  ربانى')
*/
IF OBJECT_ID('mis.Delete_ARABIC_TATWEEL') IS NOT NULL
    DROP FUNCTION mis.Delete_ARABIC_TATWEEL;
GO
CREATE FUNCTION mis.Delete_ARABIC_TATWEEL
(
    @S NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
BEGIN
    DECLARE @S_O NVARCHAR(MAX) = '';

    DECLARE @ch NVARCHAR(MAX),
            @len TINYINT = LEN(@S);

    WHILE @len > 0
    BEGIN
        SET @ch = LEFT(@S, 1);

        SELECT @S_O = @S_O + CASE
                                 WHEN @ch = NCHAR(32) THEN @ch

                                 WHEN @ch = NCHAR(1600) THEN ''
                                 ELSE
                                     @ch
                             END;

        SET @S = RIGHT(@S, @len - 1);
        SET @len = LEN(@S);
    END;

    RETURN @S_O;
END;
