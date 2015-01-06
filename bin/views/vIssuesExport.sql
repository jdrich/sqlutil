USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:38:46 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIssuesExport]'))
DROP VIEW [dbo].[vIssuesExport]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vIssuesExport
AS
SELECT        eb.event_id, em.start_time, em.end_time, em.market, eb.OrganizationID, eb.FacilityID, eb.dv, eb.cmd, eb.plc, eb.gld, eb.fsl, eb.acl, eb.pf, eb.status, issue.issue_text, 
                         emp.employee_name, emp.email
FROM            dbo.event_businesses AS eb INNER JOIN
                         dbo.event_master AS em ON em.status = 1 INNER JOIN
                         dbo.employees AS emp ON emp.employee_id = eb.caller INNER JOIN
                         dbo.issues_status AS issue ON issue.issue_id = eb.status
WHERE        (eb.status > 1)

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
               Bottom = 135
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 135
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 135
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "issue"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 233
               Right = 208
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
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:39:23 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIssuesExport]'))
DROP VIEW [dbo].[vIssuesExport]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:39:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vIssuesExport
AS
SELECT        eb.event_id, em.start_time, em.end_time, em.market, eb.OrganizationID, eb.FacilityID, eb.dv, eb.cmd, eb.plc, eb.gld, eb.fsl, eb.acl, eb.pf, eb.status, issue.issue_text, 
                         emp.employee_name, emp.email
FROM            dbo.event_businesses AS eb INNER JOIN
                         dbo.event_master AS em ON em.status = 1 INNER JOIN
                         dbo.employees AS emp ON emp.employee_id = eb.caller INNER JOIN
                         dbo.issues_status AS issue ON issue.issue_id = eb.status
WHERE        (eb.status > 1)

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
               Bottom = 135
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 135
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 135
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "issue"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 233
               Right = 208
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
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:43:57 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIssuesExport]'))
DROP VIEW [dbo].[vIssuesExport]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vIssuesExport
AS
SELECT        eb.event_id, em.start_time, em.end_time, em.market, eb.OrganizationID, eb.FacilityID, eb.dv, eb.cmd, eb.plc, eb.gld, eb.fsl, eb.acl, eb.pf, eb.status, issue.issue_text, 
                         emp.employee_name, emp.email
FROM            dbo.event_businesses AS eb INNER JOIN
                         dbo.event_master AS em ON em.status = 1 INNER JOIN
                         dbo.employees AS emp ON emp.employee_id = eb.caller INNER JOIN
                         dbo.issues_status AS issue ON issue.issue_id = eb.status
WHERE        (eb.status > 1)

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
               Bottom = 135
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 135
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 135
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "issue"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 233
               Right = 208
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
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:44:09 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIssuesExport]'))
DROP VIEW [dbo].[vIssuesExport]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vIssuesExport
AS
SELECT        eb.event_id, em.start_time, em.end_time, em.market, eb.OrganizationID, eb.FacilityID, eb.dv, eb.cmd, eb.plc, eb.gld, eb.fsl, eb.acl, eb.pf, eb.status, issue.issue_text, 
                         emp.employee_name, emp.email
FROM            dbo.event_businesses AS eb INNER JOIN
                         dbo.event_master AS em ON em.status = 1 INNER JOIN
                         dbo.employees AS emp ON emp.employee_id = eb.caller INNER JOIN
                         dbo.issues_status AS issue ON issue.issue_id = eb.status
WHERE        (eb.status > 1)

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
               Bottom = 135
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 135
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 135
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "issue"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 233
               Right = 208
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
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:57:27 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIssuesExport]'))
DROP VIEW [dbo].[vIssuesExport]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 11:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vIssuesExport
AS
SELECT        eb.event_id, em.start_time, em.end_time, em.market, eb.OrganizationID, eb.FacilityID, eb.dv, eb.cmd, eb.plc, eb.gld, eb.fsl, eb.acl, eb.pf, eb.status, issue.issue_text, 
                         emp.employee_name, emp.email
FROM            dbo.event_businesses AS eb INNER JOIN
                         dbo.event_master AS em ON em.status = 1 INNER JOIN
                         dbo.employees AS emp ON emp.employee_id = eb.caller INNER JOIN
                         dbo.issues_status AS issue ON issue.issue_id = eb.status
WHERE        (eb.status > 1)

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
               Bottom = 135
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 135
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 135
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "issue"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 233
               Right = 208
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
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 12:04:51 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIssuesExport]'))
DROP VIEW [dbo].[vIssuesExport]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 12:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vIssuesExport
AS
SELECT        eb.event_id, em.start_time, em.end_time, em.market, eb.OrganizationID, eb.FacilityID, eb.dv, eb.cmd, eb.plc, eb.gld, eb.fsl, eb.acl, eb.pf, eb.status, issue.issue_text, 
                         emp.employee_name, emp.email
FROM            dbo.event_businesses AS eb INNER JOIN
                         dbo.event_master AS em ON em.status = 1 INNER JOIN
                         dbo.employees AS emp ON emp.employee_id = eb.caller INNER JOIN
                         dbo.issues_status AS issue ON issue.issue_id = eb.status
WHERE        (eb.status > 1)

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
               Bottom = 135
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 135
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 135
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "issue"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 233
               Right = 208
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
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 12:05:00 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIssuesExport]'))
DROP VIEW [dbo].[vIssuesExport]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 12:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vIssuesExport
AS
SELECT        eb.event_id, em.start_time, em.end_time, em.market, eb.OrganizationID, eb.FacilityID, eb.dv, eb.cmd, eb.plc, eb.gld, eb.fsl, eb.acl, eb.pf, eb.status, issue.issue_text, 
                         emp.employee_name, emp.email
FROM            dbo.event_businesses AS eb INNER JOIN
                         dbo.event_master AS em ON em.status = 1 INNER JOIN
                         dbo.employees AS emp ON emp.employee_id = eb.caller INNER JOIN
                         dbo.issues_status AS issue ON issue.issue_id = eb.status
WHERE        (eb.status > 1)

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
               Bottom = 135
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 135
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 135
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "issue"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 233
               Right = 208
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
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 12:05:06 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIssuesExport]'))
DROP VIEW [dbo].[vIssuesExport]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vIssuesExport]    Script Date: 01/06/2015 12:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vIssuesExport
AS
SELECT        eb.event_id, em.start_time, em.end_time, em.market, eb.OrganizationID, eb.FacilityID, eb.dv, eb.cmd, eb.plc, eb.gld, eb.fsl, eb.acl, eb.pf, eb.status, issue.issue_text, 
                         emp.employee_name, emp.email
FROM            dbo.event_businesses AS eb INNER JOIN
                         dbo.event_master AS em ON em.status = 1 INNER JOIN
                         dbo.employees AS emp ON emp.employee_id = eb.caller INNER JOIN
                         dbo.issues_status AS issue ON issue.issue_id = eb.status
WHERE        (eb.status > 1)

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
               Bottom = 135
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 135
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 135
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "issue"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 233
               Right = 208
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
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vIssuesExport'
GO
