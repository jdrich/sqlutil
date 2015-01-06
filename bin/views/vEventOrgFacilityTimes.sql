USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:38:45 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrgFacilityTimes]'))
DROP VIEW [dbo].[vEventOrgFacilityTimes]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrgFacilityTimes
AS
SELECT     ISNULL(eb.row_id, - 1) AS row_id, eb.OrganizationID, eb.FacilityID, em.event_id AS EventID, em.status AS Status, em.market AS Market, amz.MarketName, 
                      emz.zone_id AS ZoneID, amz.ZoneShortName AS ZoneName, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 
                      100) AS StartDateTime, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) AS EndDateTime, 
                      em.start_date AS StartDate, CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 100) AS StartTime, CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) 
                      AS EndTime, emz.no_end AS NoEnd, em.event_notes AS EventNotes
FROM         dbo.event_master AS em INNER JOIN
                      dbo.event_master_zones AS emz ON emz.event_id = em.event_id INNER JOIN
                      ECSMIS.dbo.vAresMarketZone AS amz ON amz.ZoneID = emz.zone_id INNER JOIN
                      dbo.event_businesses AS eb ON eb.event_id = em.event_id AND eb.FacilityZoneID = emz.zone_id
WHERE     (em.status <> 0) AND (em.status <> 3)

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
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emz"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "amz"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 125
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 125
               Right = 840
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:39:22 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrgFacilityTimes]'))
DROP VIEW [dbo].[vEventOrgFacilityTimes]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:39:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrgFacilityTimes
AS
SELECT     ISNULL(eb.row_id, - 1) AS row_id, eb.OrganizationID, eb.FacilityID, em.event_id AS EventID, em.status AS Status, em.market AS Market, amz.MarketName, 
                      emz.zone_id AS ZoneID, amz.ZoneShortName AS ZoneName, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 
                      100) AS StartDateTime, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) AS EndDateTime, 
                      em.start_date AS StartDate, CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 100) AS StartTime, CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) 
                      AS EndTime, emz.no_end AS NoEnd, em.event_notes AS EventNotes
FROM         dbo.event_master AS em INNER JOIN
                      dbo.event_master_zones AS emz ON emz.event_id = em.event_id INNER JOIN
                      ECSMIS.dbo.vAresMarketZone AS amz ON amz.ZoneID = emz.zone_id INNER JOIN
                      dbo.event_businesses AS eb ON eb.event_id = em.event_id AND eb.FacilityZoneID = emz.zone_id
WHERE     (em.status <> 0) AND (em.status <> 3)

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
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emz"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "amz"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 125
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 125
               Right = 840
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:43:56 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrgFacilityTimes]'))
DROP VIEW [dbo].[vEventOrgFacilityTimes]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrgFacilityTimes
AS
SELECT     ISNULL(eb.row_id, - 1) AS row_id, eb.OrganizationID, eb.FacilityID, em.event_id AS EventID, em.status AS Status, em.market AS Market, amz.MarketName, 
                      emz.zone_id AS ZoneID, amz.ZoneShortName AS ZoneName, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 
                      100) AS StartDateTime, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) AS EndDateTime, 
                      em.start_date AS StartDate, CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 100) AS StartTime, CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) 
                      AS EndTime, emz.no_end AS NoEnd, em.event_notes AS EventNotes
FROM         dbo.event_master AS em INNER JOIN
                      dbo.event_master_zones AS emz ON emz.event_id = em.event_id INNER JOIN
                      ECSMIS.dbo.vAresMarketZone AS amz ON amz.ZoneID = emz.zone_id INNER JOIN
                      dbo.event_businesses AS eb ON eb.event_id = em.event_id AND eb.FacilityZoneID = emz.zone_id
WHERE     (em.status <> 0) AND (em.status <> 3)

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
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emz"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "amz"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 125
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 125
               Right = 840
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:44:08 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrgFacilityTimes]'))
DROP VIEW [dbo].[vEventOrgFacilityTimes]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrgFacilityTimes
AS
SELECT     ISNULL(eb.row_id, - 1) AS row_id, eb.OrganizationID, eb.FacilityID, em.event_id AS EventID, em.status AS Status, em.market AS Market, amz.MarketName, 
                      emz.zone_id AS ZoneID, amz.ZoneShortName AS ZoneName, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 
                      100) AS StartDateTime, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) AS EndDateTime, 
                      em.start_date AS StartDate, CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 100) AS StartTime, CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) 
                      AS EndTime, emz.no_end AS NoEnd, em.event_notes AS EventNotes
FROM         dbo.event_master AS em INNER JOIN
                      dbo.event_master_zones AS emz ON emz.event_id = em.event_id INNER JOIN
                      ECSMIS.dbo.vAresMarketZone AS amz ON amz.ZoneID = emz.zone_id INNER JOIN
                      dbo.event_businesses AS eb ON eb.event_id = em.event_id AND eb.FacilityZoneID = emz.zone_id
WHERE     (em.status <> 0) AND (em.status <> 3)

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
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emz"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "amz"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 125
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 125
               Right = 840
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:57:26 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrgFacilityTimes]'))
DROP VIEW [dbo].[vEventOrgFacilityTimes]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 11:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrgFacilityTimes
AS
SELECT     ISNULL(eb.row_id, - 1) AS row_id, eb.OrganizationID, eb.FacilityID, em.event_id AS EventID, em.status AS Status, em.market AS Market, amz.MarketName, 
                      emz.zone_id AS ZoneID, amz.ZoneShortName AS ZoneName, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 
                      100) AS StartDateTime, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) AS EndDateTime, 
                      em.start_date AS StartDate, CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 100) AS StartTime, CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) 
                      AS EndTime, emz.no_end AS NoEnd, em.event_notes AS EventNotes
FROM         dbo.event_master AS em INNER JOIN
                      dbo.event_master_zones AS emz ON emz.event_id = em.event_id INNER JOIN
                      ECSMIS.dbo.vAresMarketZone AS amz ON amz.ZoneID = emz.zone_id INNER JOIN
                      dbo.event_businesses AS eb ON eb.event_id = em.event_id AND eb.FacilityZoneID = emz.zone_id
WHERE     (em.status <> 0) AND (em.status <> 3)

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
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emz"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "amz"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 125
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 125
               Right = 840
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 12:04:50 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrgFacilityTimes]'))
DROP VIEW [dbo].[vEventOrgFacilityTimes]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 12:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrgFacilityTimes
AS
SELECT     ISNULL(eb.row_id, - 1) AS row_id, eb.OrganizationID, eb.FacilityID, em.event_id AS EventID, em.status AS Status, em.market AS Market, amz.MarketName, 
                      emz.zone_id AS ZoneID, amz.ZoneShortName AS ZoneName, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 
                      100) AS StartDateTime, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) AS EndDateTime, 
                      em.start_date AS StartDate, CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 100) AS StartTime, CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) 
                      AS EndTime, emz.no_end AS NoEnd, em.event_notes AS EventNotes
FROM         dbo.event_master AS em INNER JOIN
                      dbo.event_master_zones AS emz ON emz.event_id = em.event_id INNER JOIN
                      ECSMIS.dbo.vAresMarketZone AS amz ON amz.ZoneID = emz.zone_id INNER JOIN
                      dbo.event_businesses AS eb ON eb.event_id = em.event_id AND eb.FacilityZoneID = emz.zone_id
WHERE     (em.status <> 0) AND (em.status <> 3)

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
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emz"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "amz"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 125
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 125
               Right = 840
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 12:04:59 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrgFacilityTimes]'))
DROP VIEW [dbo].[vEventOrgFacilityTimes]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 12:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrgFacilityTimes
AS
SELECT     ISNULL(eb.row_id, - 1) AS row_id, eb.OrganizationID, eb.FacilityID, em.event_id AS EventID, em.status AS Status, em.market AS Market, amz.MarketName, 
                      emz.zone_id AS ZoneID, amz.ZoneShortName AS ZoneName, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 
                      100) AS StartDateTime, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) AS EndDateTime, 
                      em.start_date AS StartDate, CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 100) AS StartTime, CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) 
                      AS EndTime, emz.no_end AS NoEnd, em.event_notes AS EventNotes
FROM         dbo.event_master AS em INNER JOIN
                      dbo.event_master_zones AS emz ON emz.event_id = em.event_id INNER JOIN
                      ECSMIS.dbo.vAresMarketZone AS amz ON amz.ZoneID = emz.zone_id INNER JOIN
                      dbo.event_businesses AS eb ON eb.event_id = em.event_id AND eb.FacilityZoneID = emz.zone_id
WHERE     (em.status <> 0) AND (em.status <> 3)

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
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emz"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "amz"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 125
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 125
               Right = 840
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 12:05:06 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrgFacilityTimes]'))
DROP VIEW [dbo].[vEventOrgFacilityTimes]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrgFacilityTimes]    Script Date: 01/06/2015 12:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrgFacilityTimes
AS
SELECT     ISNULL(eb.row_id, - 1) AS row_id, eb.OrganizationID, eb.FacilityID, em.event_id AS EventID, em.status AS Status, em.market AS Market, amz.MarketName, 
                      emz.zone_id AS ZoneID, amz.ZoneShortName AS ZoneName, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 
                      100) AS StartDateTime, CAST(em.start_date AS VARCHAR(12)) + ' ' + CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) AS EndDateTime, 
                      em.start_date AS StartDate, CONVERT(VARCHAR(15), CAST(emz.start_time AS TIME), 100) AS StartTime, CONVERT(VARCHAR(15), CAST(emz.end_time AS TIME), 100) 
                      AS EndTime, emz.no_end AS NoEnd, em.event_notes AS EventNotes
FROM         dbo.event_master AS em INNER JOIN
                      dbo.event_master_zones AS emz ON emz.event_id = em.event_id INNER JOIN
                      ECSMIS.dbo.vAresMarketZone AS amz ON amz.ZoneID = emz.zone_id INNER JOIN
                      dbo.event_businesses AS eb ON eb.event_id = em.event_id AND eb.FacilityZoneID = emz.zone_id
WHERE     (em.status <> 0) AND (em.status <> 3)

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
         Begin Table = "em"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emz"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "amz"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 125
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eb"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 125
               Right = 840
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrgFacilityTimes'
GO
