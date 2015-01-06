USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:38:45 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFacilityDetails]'))
DROP VIEW [dbo].[vEventFacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:38:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventFacilityDetails
AS
SELECT     eb.event_id AS EventID, em.status AS EventStatus, emz.status AS ZoneStatus, amz.MarketID AS MarketID, eb.OrganizationID, ISNULL(eb.FacilityID, - 1) AS FacilityID, 
                      f.FacilityName, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, eb.status AS Status, eb.last_modified AS LastModified, 
                      eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, eb.performance_level AS PerformanceLevel, 
                      st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID
                                                           GROUP BY acct.AccountNumber FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacility] f ON f.FacilityID = eb.FacilityID JOIN
                      event_master em ON em.event_id = eb.event_id JOIN
                      event_master_zones emz ON emz.event_id = em.event_id AND emz.zone_id = eb.FacilityZoneID

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:39:22 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFacilityDetails]'))
DROP VIEW [dbo].[vEventFacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:39:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventFacilityDetails
AS
SELECT     eb.event_id AS EventID, em.status AS EventStatus, emz.status AS ZoneStatus, amz.MarketID AS MarketID, eb.OrganizationID, ISNULL(eb.FacilityID, - 1) AS FacilityID, 
                      f.FacilityName, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, eb.status AS Status, eb.last_modified AS LastModified, 
                      eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, eb.performance_level AS PerformanceLevel, 
                      st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID
                                                           GROUP BY acct.AccountNumber FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacility] f ON f.FacilityID = eb.FacilityID JOIN
                      event_master em ON em.event_id = eb.event_id JOIN
                      event_master_zones emz ON emz.event_id = em.event_id AND emz.zone_id = eb.FacilityZoneID

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:43:56 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFacilityDetails]'))
DROP VIEW [dbo].[vEventFacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventFacilityDetails
AS
SELECT     eb.event_id AS EventID, em.status AS EventStatus, emz.status AS ZoneStatus, amz.MarketID AS MarketID, eb.OrganizationID, ISNULL(eb.FacilityID, - 1) AS FacilityID, 
                      f.FacilityName, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, eb.status AS Status, eb.last_modified AS LastModified, 
                      eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, eb.performance_level AS PerformanceLevel, 
                      st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID
                                                           GROUP BY acct.AccountNumber FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacility] f ON f.FacilityID = eb.FacilityID JOIN
                      event_master em ON em.event_id = eb.event_id JOIN
                      event_master_zones emz ON emz.event_id = em.event_id AND emz.zone_id = eb.FacilityZoneID

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:44:08 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFacilityDetails]'))
DROP VIEW [dbo].[vEventFacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventFacilityDetails
AS
SELECT     eb.event_id AS EventID, em.status AS EventStatus, emz.status AS ZoneStatus, amz.MarketID AS MarketID, eb.OrganizationID, ISNULL(eb.FacilityID, - 1) AS FacilityID, 
                      f.FacilityName, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, eb.status AS Status, eb.last_modified AS LastModified, 
                      eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, eb.performance_level AS PerformanceLevel, 
                      st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID
                                                           GROUP BY acct.AccountNumber FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacility] f ON f.FacilityID = eb.FacilityID JOIN
                      event_master em ON em.event_id = eb.event_id JOIN
                      event_master_zones emz ON emz.event_id = em.event_id AND emz.zone_id = eb.FacilityZoneID

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:57:26 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFacilityDetails]'))
DROP VIEW [dbo].[vEventFacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 11:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventFacilityDetails
AS
SELECT     eb.event_id AS EventID, em.status AS EventStatus, emz.status AS ZoneStatus, amz.MarketID AS MarketID, eb.OrganizationID, ISNULL(eb.FacilityID, - 1) AS FacilityID, 
                      f.FacilityName, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, eb.status AS Status, eb.last_modified AS LastModified, 
                      eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, eb.performance_level AS PerformanceLevel, 
                      st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID
                                                           GROUP BY acct.AccountNumber FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacility] f ON f.FacilityID = eb.FacilityID JOIN
                      event_master em ON em.event_id = eb.event_id JOIN
                      event_master_zones emz ON emz.event_id = em.event_id AND emz.zone_id = eb.FacilityZoneID

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 12:04:50 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFacilityDetails]'))
DROP VIEW [dbo].[vEventFacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 12:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventFacilityDetails
AS
SELECT     eb.event_id AS EventID, em.status AS EventStatus, emz.status AS ZoneStatus, amz.MarketID AS MarketID, eb.OrganizationID, ISNULL(eb.FacilityID, - 1) AS FacilityID, 
                      f.FacilityName, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, eb.status AS Status, eb.last_modified AS LastModified, 
                      eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, eb.performance_level AS PerformanceLevel, 
                      st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID
                                                           GROUP BY acct.AccountNumber FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacility] f ON f.FacilityID = eb.FacilityID JOIN
                      event_master em ON em.event_id = eb.event_id JOIN
                      event_master_zones emz ON emz.event_id = em.event_id AND emz.zone_id = eb.FacilityZoneID

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 12:04:59 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFacilityDetails]'))
DROP VIEW [dbo].[vEventFacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 12:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventFacilityDetails
AS
SELECT     eb.event_id AS EventID, em.status AS EventStatus, emz.status AS ZoneStatus, amz.MarketID AS MarketID, eb.OrganizationID, ISNULL(eb.FacilityID, - 1) AS FacilityID, 
                      f.FacilityName, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, eb.status AS Status, eb.last_modified AS LastModified, 
                      eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, eb.performance_level AS PerformanceLevel, 
                      st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID
                                                           GROUP BY acct.AccountNumber FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacility] f ON f.FacilityID = eb.FacilityID JOIN
                      event_master em ON em.event_id = eb.event_id JOIN
                      event_master_zones emz ON emz.event_id = em.event_id AND emz.zone_id = eb.FacilityZoneID

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 12:05:05 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFacilityDetails]'))
DROP VIEW [dbo].[vEventFacilityDetails]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventFacilityDetails]    Script Date: 01/06/2015 12:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventFacilityDetails
AS
SELECT     eb.event_id AS EventID, em.status AS EventStatus, emz.status AS ZoneStatus, amz.MarketID AS MarketID, eb.OrganizationID, ISNULL(eb.FacilityID, - 1) AS FacilityID, 
                      f.FacilityName, eb.dv AS DV, eb.cmd AS CMD, eb.plc AS PLC, eb.gld AS GLD, eb.fsl AS FSL, eb.acl AS ACL, eb.status AS Status, eb.last_modified AS LastModified, 
                      eb.modified_by AS ModifiedBy, eb.pf AS PF, eb.FacilityZoneID, amz.ZoneShortName AS ZoneName, eb.performance_level AS PerformanceLevel, 
                      st.status_text AS StatusText, act.Street, act.City, act.State, act.Zip,
                          (SELECT DISTINCT STUFF
                                                       ((SELECT     ',' + CAST(acct.AccountNumber AS VARCHAR(MAX))
                                                           FROM         [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] acct
                                                           WHERE     acct.FacilityID = eb.FacilityID
                                                           GROUP BY acct.AccountNumber FOR xml path('')), 1, 1, '')) AS AccountNumbers
FROM         event_businesses eb JOIN
                      [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = eb.FacilityZoneID JOIN
                      status_text st ON st.status_id = eb.status JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacilityAccount] act ON act.FacilityID = eb.FacilityID JOIN
                      [ECSMIS].[dbo].[vAresMarketZoneOrgFacility] f ON f.FacilityID = eb.FacilityID JOIN
                      event_master em ON em.event_id = eb.event_id JOIN
                      event_master_zones emz ON emz.event_id = em.event_id AND emz.zone_id = eb.FacilityZoneID

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventFacilityDetails'
GO
