USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:38:45 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAwards]'))
DROP VIEW [dbo].[vAwards]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:38:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAwards]
AS
SELECT     IsNull(eb.caller, -1) as caller, emp.employee_name, emp.email, COUNT(DISTINCT eb.event_id) AS NumEvents, SUM(eb.dv) AS TotalDV, COUNT(DISTINCT eb.OrganizationID) 
                      AS TotalBusinesses,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status = 0)
                            GROUP BY caller) AS UnconfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (1, 11))
                            GROUP BY caller) AS ConfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (3, 4, 6, 7, 14, 15, 16, 17, 18))
                            GROUP BY caller) AS IssueDV
FROM         dbo.event_businesses AS eb INNER JOIN
                      dbo.employees AS emp ON emp.employee_id = eb.caller
WHERE     (eb.caller <> 0)
GROUP BY eb.caller, emp.employee_name, emp.email


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:39:21 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAwards]'))
DROP VIEW [dbo].[vAwards]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAwards]
AS
SELECT     IsNull(eb.caller, -1) as caller, emp.employee_name, emp.email, COUNT(DISTINCT eb.event_id) AS NumEvents, SUM(eb.dv) AS TotalDV, COUNT(DISTINCT eb.OrganizationID) 
                      AS TotalBusinesses,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status = 0)
                            GROUP BY caller) AS UnconfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (1, 11))
                            GROUP BY caller) AS ConfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (3, 4, 6, 7, 14, 15, 16, 17, 18))
                            GROUP BY caller) AS IssueDV
FROM         dbo.event_businesses AS eb INNER JOIN
                      dbo.employees AS emp ON emp.employee_id = eb.caller
WHERE     (eb.caller <> 0)
GROUP BY eb.caller, emp.employee_name, emp.email


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:43:55 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAwards]'))
DROP VIEW [dbo].[vAwards]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAwards]
AS
SELECT     IsNull(eb.caller, -1) as caller, emp.employee_name, emp.email, COUNT(DISTINCT eb.event_id) AS NumEvents, SUM(eb.dv) AS TotalDV, COUNT(DISTINCT eb.OrganizationID) 
                      AS TotalBusinesses,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status = 0)
                            GROUP BY caller) AS UnconfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (1, 11))
                            GROUP BY caller) AS ConfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (3, 4, 6, 7, 14, 15, 16, 17, 18))
                            GROUP BY caller) AS IssueDV
FROM         dbo.event_businesses AS eb INNER JOIN
                      dbo.employees AS emp ON emp.employee_id = eb.caller
WHERE     (eb.caller <> 0)
GROUP BY eb.caller, emp.employee_name, emp.email


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:44:07 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAwards]'))
DROP VIEW [dbo].[vAwards]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAwards]
AS
SELECT     IsNull(eb.caller, -1) as caller, emp.employee_name, emp.email, COUNT(DISTINCT eb.event_id) AS NumEvents, SUM(eb.dv) AS TotalDV, COUNT(DISTINCT eb.OrganizationID) 
                      AS TotalBusinesses,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status = 0)
                            GROUP BY caller) AS UnconfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (1, 11))
                            GROUP BY caller) AS ConfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (3, 4, 6, 7, 14, 15, 16, 17, 18))
                            GROUP BY caller) AS IssueDV
FROM         dbo.event_businesses AS eb INNER JOIN
                      dbo.employees AS emp ON emp.employee_id = eb.caller
WHERE     (eb.caller <> 0)
GROUP BY eb.caller, emp.employee_name, emp.email


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:57:26 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAwards]'))
DROP VIEW [dbo].[vAwards]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 11:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAwards]
AS
SELECT     IsNull(eb.caller, -1) as caller, emp.employee_name, emp.email, COUNT(DISTINCT eb.event_id) AS NumEvents, SUM(eb.dv) AS TotalDV, COUNT(DISTINCT eb.OrganizationID) 
                      AS TotalBusinesses,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status = 0)
                            GROUP BY caller) AS UnconfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (1, 11))
                            GROUP BY caller) AS ConfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (3, 4, 6, 7, 14, 15, 16, 17, 18))
                            GROUP BY caller) AS IssueDV
FROM         dbo.event_businesses AS eb INNER JOIN
                      dbo.employees AS emp ON emp.employee_id = eb.caller
WHERE     (eb.caller <> 0)
GROUP BY eb.caller, emp.employee_name, emp.email


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 12:04:49 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAwards]'))
DROP VIEW [dbo].[vAwards]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 12:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAwards]
AS
SELECT     IsNull(eb.caller, -1) as caller, emp.employee_name, emp.email, COUNT(DISTINCT eb.event_id) AS NumEvents, SUM(eb.dv) AS TotalDV, COUNT(DISTINCT eb.OrganizationID) 
                      AS TotalBusinesses,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status = 0)
                            GROUP BY caller) AS UnconfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (1, 11))
                            GROUP BY caller) AS ConfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (3, 4, 6, 7, 14, 15, 16, 17, 18))
                            GROUP BY caller) AS IssueDV
FROM         dbo.event_businesses AS eb INNER JOIN
                      dbo.employees AS emp ON emp.employee_id = eb.caller
WHERE     (eb.caller <> 0)
GROUP BY eb.caller, emp.employee_name, emp.email


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 12:04:58 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAwards]'))
DROP VIEW [dbo].[vAwards]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 12:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAwards]
AS
SELECT     IsNull(eb.caller, -1) as caller, emp.employee_name, emp.email, COUNT(DISTINCT eb.event_id) AS NumEvents, SUM(eb.dv) AS TotalDV, COUNT(DISTINCT eb.OrganizationID) 
                      AS TotalBusinesses,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status = 0)
                            GROUP BY caller) AS UnconfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (1, 11))
                            GROUP BY caller) AS ConfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (3, 4, 6, 7, 14, 15, 16, 17, 18))
                            GROUP BY caller) AS IssueDV
FROM         dbo.event_businesses AS eb INNER JOIN
                      dbo.employees AS emp ON emp.employee_id = eb.caller
WHERE     (eb.caller <> 0)
GROUP BY eb.caller, emp.employee_name, emp.email


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 12:05:05 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAwards]'))
DROP VIEW [dbo].[vAwards]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vAwards]    Script Date: 01/06/2015 12:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAwards]
AS
SELECT     IsNull(eb.caller, -1) as caller, emp.employee_name, emp.email, COUNT(DISTINCT eb.event_id) AS NumEvents, SUM(eb.dv) AS TotalDV, COUNT(DISTINCT eb.OrganizationID) 
                      AS TotalBusinesses,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status = 0)
                            GROUP BY caller) AS UnconfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (1, 11))
                            GROUP BY caller) AS ConfirmedDV,
                          (SELECT     SUM(dv) AS Expr1
                            FROM          dbo.event_businesses AS tmp
                            WHERE      (caller = eb.caller) AND (status IN (3, 4, 6, 7, 14, 15, 16, 17, 18))
                            GROUP BY caller) AS IssueDV
FROM         dbo.event_businesses AS eb INNER JOIN
                      dbo.employees AS emp ON emp.employee_id = eb.caller
WHERE     (eb.caller <> 0)
GROUP BY eb.caller, emp.employee_name, emp.email


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAwards'
GO
