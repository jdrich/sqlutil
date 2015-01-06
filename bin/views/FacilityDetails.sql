USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:38:44 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacilityDetails]'))
DROP VIEW [dbo].[FacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.FacilityDetails
AS
SELECT     amz.MarketID AS MarketID, eb.OrganizationID, eb.FacilityID, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, 
                      eb.status AS Status, eb.last_modified AS LastModified, eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, 
                      eb.performance_level AS PerformanceLevel, st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID
WHERE     event_id IN
                          (SELECT     em.event_id
                            FROM          event_master em JOIN
                                                   event_master_zones emz ON emz.event_id = em.event_id
                            WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0)

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:39:21 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacilityDetails]'))
DROP VIEW [dbo].[FacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.FacilityDetails
AS
SELECT     amz.MarketID AS MarketID, eb.OrganizationID, eb.FacilityID, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, 
                      eb.status AS Status, eb.last_modified AS LastModified, eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, 
                      eb.performance_level AS PerformanceLevel, st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID
WHERE     event_id IN
                          (SELECT     em.event_id
                            FROM          event_master em JOIN
                                                   event_master_zones emz ON emz.event_id = em.event_id
                            WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0)

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:43:54 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacilityDetails]'))
DROP VIEW [dbo].[FacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.FacilityDetails
AS
SELECT     amz.MarketID AS MarketID, eb.OrganizationID, eb.FacilityID, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, 
                      eb.status AS Status, eb.last_modified AS LastModified, eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, 
                      eb.performance_level AS PerformanceLevel, st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID
WHERE     event_id IN
                          (SELECT     em.event_id
                            FROM          event_master em JOIN
                                                   event_master_zones emz ON emz.event_id = em.event_id
                            WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0)

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:44:06 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacilityDetails]'))
DROP VIEW [dbo].[FacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.FacilityDetails
AS
SELECT     amz.MarketID AS MarketID, eb.OrganizationID, eb.FacilityID, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, 
                      eb.status AS Status, eb.last_modified AS LastModified, eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, 
                      eb.performance_level AS PerformanceLevel, st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID
WHERE     event_id IN
                          (SELECT     em.event_id
                            FROM          event_master em JOIN
                                                   event_master_zones emz ON emz.event_id = em.event_id
                            WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0)

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:57:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacilityDetails]'))
DROP VIEW [dbo].[FacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 11:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.FacilityDetails
AS
SELECT     amz.MarketID AS MarketID, eb.OrganizationID, eb.FacilityID, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, 
                      eb.status AS Status, eb.last_modified AS LastModified, eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, 
                      eb.performance_level AS PerformanceLevel, st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID
WHERE     event_id IN
                          (SELECT     em.event_id
                            FROM          event_master em JOIN
                                                   event_master_zones emz ON emz.event_id = em.event_id
                            WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0)

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 12:04:48 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacilityDetails]'))
DROP VIEW [dbo].[FacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 12:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.FacilityDetails
AS
SELECT     amz.MarketID AS MarketID, eb.OrganizationID, eb.FacilityID, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, 
                      eb.status AS Status, eb.last_modified AS LastModified, eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, 
                      eb.performance_level AS PerformanceLevel, st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID
WHERE     event_id IN
                          (SELECT     em.event_id
                            FROM          event_master em JOIN
                                                   event_master_zones emz ON emz.event_id = em.event_id
                            WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0)

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 12:04:58 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacilityDetails]'))
DROP VIEW [dbo].[FacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 12:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.FacilityDetails
AS
SELECT     amz.MarketID AS MarketID, eb.OrganizationID, eb.FacilityID, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, 
                      eb.status AS Status, eb.last_modified AS LastModified, eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, 
                      eb.performance_level AS PerformanceLevel, st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID
WHERE     event_id IN
                          (SELECT     em.event_id
                            FROM          event_master em JOIN
                                                   event_master_zones emz ON emz.event_id = em.event_id
                            WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0)

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 12:05:04 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FacilityDetails]'))
DROP VIEW [dbo].[FacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[FacilityDetails]    Script Date: 01/06/2015 12:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.FacilityDetails
AS
SELECT     amz.MarketID AS MarketID, eb.OrganizationID, eb.FacilityID, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, 
                      eb.status AS Status, eb.last_modified AS LastModified, eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, 
                      eb.performance_level AS PerformanceLevel, st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID
WHERE     event_id IN
                          (SELECT     em.event_id
                            FROM          event_master em JOIN
                                                   event_master_zones emz ON emz.event_id = em.event_id
                            WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0)

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FacilityDetails'
GO
