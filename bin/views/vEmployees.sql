USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:38:45 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEmployees]'))
DROP VIEW [dbo].[vEmployees]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:38:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees] WITH SCHEMABINDING AS
SELECT 
employee_id as EmployeeID,
status as Status,
available as Available,
rank as EmployeeRank,
employee_name as EmployeeName,
email as Email,
thresh_order as ThreshOrder,
thresh_name as ThreshGroup,
thresh_name_style as ThreshStyle
FROM [dbo].[employees] emp
LEFT OUTER JOIN [dbo].[thresh_levels] tl ON (emp.rank <= tl.max_rank AND emp.rank >= tl.min_rank)
WHERE emp.status <> 0 AND tl.thresh_status <> 0
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:39:21 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEmployees]'))
DROP VIEW [dbo].[vEmployees]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:39:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees] WITH SCHEMABINDING AS
SELECT 
employee_id as EmployeeID,
status as Status,
available as Available,
rank as EmployeeRank,
employee_name as EmployeeName,
email as Email,
thresh_order as ThreshOrder,
thresh_name as ThreshGroup,
thresh_name_style as ThreshStyle
FROM [dbo].[employees] emp
LEFT OUTER JOIN [dbo].[thresh_levels] tl ON (emp.rank <= tl.max_rank AND emp.rank >= tl.min_rank)
WHERE emp.status <> 0 AND tl.thresh_status <> 0
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:43:55 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEmployees]'))
DROP VIEW [dbo].[vEmployees]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees] WITH SCHEMABINDING AS
SELECT 
employee_id as EmployeeID,
status as Status,
available as Available,
rank as EmployeeRank,
employee_name as EmployeeName,
email as Email,
thresh_order as ThreshOrder,
thresh_name as ThreshGroup,
thresh_name_style as ThreshStyle
FROM [dbo].[employees] emp
LEFT OUTER JOIN [dbo].[thresh_levels] tl ON (emp.rank <= tl.max_rank AND emp.rank >= tl.min_rank)
WHERE emp.status <> 0 AND tl.thresh_status <> 0
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:44:07 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEmployees]'))
DROP VIEW [dbo].[vEmployees]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees] WITH SCHEMABINDING AS
SELECT 
employee_id as EmployeeID,
status as Status,
available as Available,
rank as EmployeeRank,
employee_name as EmployeeName,
email as Email,
thresh_order as ThreshOrder,
thresh_name as ThreshGroup,
thresh_name_style as ThreshStyle
FROM [dbo].[employees] emp
LEFT OUTER JOIN [dbo].[thresh_levels] tl ON (emp.rank <= tl.max_rank AND emp.rank >= tl.min_rank)
WHERE emp.status <> 0 AND tl.thresh_status <> 0
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:57:26 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEmployees]'))
DROP VIEW [dbo].[vEmployees]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 11:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees] WITH SCHEMABINDING AS
SELECT 
employee_id as EmployeeID,
status as Status,
available as Available,
rank as EmployeeRank,
employee_name as EmployeeName,
email as Email,
thresh_order as ThreshOrder,
thresh_name as ThreshGroup,
thresh_name_style as ThreshStyle
FROM [dbo].[employees] emp
LEFT OUTER JOIN [dbo].[thresh_levels] tl ON (emp.rank <= tl.max_rank AND emp.rank >= tl.min_rank)
WHERE emp.status <> 0 AND tl.thresh_status <> 0
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 12:04:49 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEmployees]'))
DROP VIEW [dbo].[vEmployees]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 12:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees] WITH SCHEMABINDING AS
SELECT 
employee_id as EmployeeID,
status as Status,
available as Available,
rank as EmployeeRank,
employee_name as EmployeeName,
email as Email,
thresh_order as ThreshOrder,
thresh_name as ThreshGroup,
thresh_name_style as ThreshStyle
FROM [dbo].[employees] emp
LEFT OUTER JOIN [dbo].[thresh_levels] tl ON (emp.rank <= tl.max_rank AND emp.rank >= tl.min_rank)
WHERE emp.status <> 0 AND tl.thresh_status <> 0
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 12:04:59 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEmployees]'))
DROP VIEW [dbo].[vEmployees]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 12:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees] WITH SCHEMABINDING AS
SELECT 
employee_id as EmployeeID,
status as Status,
available as Available,
rank as EmployeeRank,
employee_name as EmployeeName,
email as Email,
thresh_order as ThreshOrder,
thresh_name as ThreshGroup,
thresh_name_style as ThreshStyle
FROM [dbo].[employees] emp
LEFT OUTER JOIN [dbo].[thresh_levels] tl ON (emp.rank <= tl.max_rank AND emp.rank >= tl.min_rank)
WHERE emp.status <> 0 AND tl.thresh_status <> 0
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 12:05:05 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEmployees]'))
DROP VIEW [dbo].[vEmployees]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEmployees]    Script Date: 01/06/2015 12:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEmployees] WITH SCHEMABINDING AS
SELECT 
employee_id as EmployeeID,
status as Status,
available as Available,
rank as EmployeeRank,
employee_name as EmployeeName,
email as Email,
thresh_order as ThreshOrder,
thresh_name as ThreshGroup,
thresh_name_style as ThreshStyle
FROM [dbo].[employees] emp
LEFT OUTER JOIN [dbo].[thresh_levels] tl ON (emp.rank <= tl.max_rank AND emp.rank >= tl.min_rank)
WHERE emp.status <> 0 AND tl.thresh_status <> 0
GO
