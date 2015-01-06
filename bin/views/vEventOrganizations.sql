USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:38:45 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrganizations]'))
DROP VIEW [dbo].[vEventOrganizations]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:38:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrganizations
AS
SELECT DISTINCT 
ISNULL(eb.OrganizationID, -1) AS OrganizationID, 
eb.event_id AS EventID, 
em.Market AS MarketID, 
eb.caller AS CallerID, 
amz.ShortName AS MarketName, 
p.Name AS OrganizationName,
(SELECT sum(dv) from event_businesses tmp WHERE tmp.OrganizationID = eb.OrganizationID AND tmp.event_id = eb.event_id) as DV,
fc.FacilityCount, 
fc.PendingCount, 
fc.ConfirmedCount, 
fc.IssueCount, 
ocs.NoteCount, 
CONVERT(VARCHAR(15), 
CAST(ocs.LastContact AS datetime), 100) AS LastContact,
(SELECT     TOP 1 CONVERT(VARCHAR(15), CAST(transfer_time AS time), 100)
	FROM          event_transfers et
	WHERE      et.OrganizationID = eb.OrganizationID AND et.event_id = eb.event_id AND et.transfer_time > DATEADD(mi, - 10, GETDATE())) 
AS TransferTime,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(tmp.status AS VARCHAR(MAX))
	FROM         event_businesses tmp
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.status FOR xml path('')), 1, 1, '')) 
AS StatusList,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(amz.ZoneShortName AS VARCHAR(MAX))
	FROM         event_businesses tmp JOIN
						 [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = tmp.FacilityZoneID
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.FacilityZoneID, amz.ZoneShortName FOR xml path('')), 1, 1, '')) 
AS ZoneList

FROM         event_businesses eb JOIN
event_master em ON em.event_id = eb.event_id LEFT JOIN
svOrgCommSummary ocs ON ocs.event_id = eb.event_id AND ocs.OrganizationID = eb.OrganizationID JOIN
svFacilityCount fc ON fc.event_id = eb.event_id AND fc.OrganizationID = eb.OrganizationID JOIN
[ECSMIS].[dbo].[vAresMarketZone] amz ON amz.MarketID = em.market JOIN
[ECSMIS].[dbo].Party p ON p.PartyID = eb.OrganizationID
WHERE     eb.event_id IN
	(SELECT     em.event_id
	FROM          event_master em JOIN
	event_master_zones emz ON emz.event_id = em.event_id
	WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
	GROUP BY em.event_id)

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
         Top = -1152
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:39:22 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrganizations]'))
DROP VIEW [dbo].[vEventOrganizations]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:39:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrganizations
AS
SELECT DISTINCT 
ISNULL(eb.OrganizationID, -1) AS OrganizationID, 
eb.event_id AS EventID, 
em.Market AS MarketID, 
eb.caller AS CallerID, 
amz.ShortName AS MarketName, 
p.Name AS OrganizationName,
(SELECT sum(dv) from event_businesses tmp WHERE tmp.OrganizationID = eb.OrganizationID AND tmp.event_id = eb.event_id) as DV,
fc.FacilityCount, 
fc.PendingCount, 
fc.ConfirmedCount, 
fc.IssueCount, 
ocs.NoteCount, 
CONVERT(VARCHAR(15), 
CAST(ocs.LastContact AS datetime), 100) AS LastContact,
(SELECT     TOP 1 CONVERT(VARCHAR(15), CAST(transfer_time AS time), 100)
	FROM          event_transfers et
	WHERE      et.OrganizationID = eb.OrganizationID AND et.event_id = eb.event_id AND et.transfer_time > DATEADD(mi, - 10, GETDATE())) 
AS TransferTime,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(tmp.status AS VARCHAR(MAX))
	FROM         event_businesses tmp
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.status FOR xml path('')), 1, 1, '')) 
AS StatusList,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(amz.ZoneShortName AS VARCHAR(MAX))
	FROM         event_businesses tmp JOIN
						 [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = tmp.FacilityZoneID
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.FacilityZoneID, amz.ZoneShortName FOR xml path('')), 1, 1, '')) 
AS ZoneList

FROM         event_businesses eb JOIN
event_master em ON em.event_id = eb.event_id LEFT JOIN
svOrgCommSummary ocs ON ocs.event_id = eb.event_id AND ocs.OrganizationID = eb.OrganizationID JOIN
svFacilityCount fc ON fc.event_id = eb.event_id AND fc.OrganizationID = eb.OrganizationID JOIN
[ECSMIS].[dbo].[vAresMarketZone] amz ON amz.MarketID = em.market JOIN
[ECSMIS].[dbo].Party p ON p.PartyID = eb.OrganizationID
WHERE     eb.event_id IN
	(SELECT     em.event_id
	FROM          event_master em JOIN
	event_master_zones emz ON emz.event_id = em.event_id
	WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
	GROUP BY em.event_id)

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
         Top = -1152
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:43:56 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrganizations]'))
DROP VIEW [dbo].[vEventOrganizations]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrganizations
AS
SELECT DISTINCT 
ISNULL(eb.OrganizationID, -1) AS OrganizationID, 
eb.event_id AS EventID, 
em.Market AS MarketID, 
eb.caller AS CallerID, 
amz.ShortName AS MarketName, 
p.Name AS OrganizationName,
(SELECT sum(dv) from event_businesses tmp WHERE tmp.OrganizationID = eb.OrganizationID AND tmp.event_id = eb.event_id) as DV,
fc.FacilityCount, 
fc.PendingCount, 
fc.ConfirmedCount, 
fc.IssueCount, 
ocs.NoteCount, 
CONVERT(VARCHAR(15), 
CAST(ocs.LastContact AS datetime), 100) AS LastContact,
(SELECT     TOP 1 CONVERT(VARCHAR(15), CAST(transfer_time AS time), 100)
	FROM          event_transfers et
	WHERE      et.OrganizationID = eb.OrganizationID AND et.event_id = eb.event_id AND et.transfer_time > DATEADD(mi, - 10, GETDATE())) 
AS TransferTime,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(tmp.status AS VARCHAR(MAX))
	FROM         event_businesses tmp
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.status FOR xml path('')), 1, 1, '')) 
AS StatusList,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(amz.ZoneShortName AS VARCHAR(MAX))
	FROM         event_businesses tmp JOIN
						 [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = tmp.FacilityZoneID
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.FacilityZoneID, amz.ZoneShortName FOR xml path('')), 1, 1, '')) 
AS ZoneList

FROM         event_businesses eb JOIN
event_master em ON em.event_id = eb.event_id LEFT JOIN
svOrgCommSummary ocs ON ocs.event_id = eb.event_id AND ocs.OrganizationID = eb.OrganizationID JOIN
svFacilityCount fc ON fc.event_id = eb.event_id AND fc.OrganizationID = eb.OrganizationID JOIN
[ECSMIS].[dbo].[vAresMarketZone] amz ON amz.MarketID = em.market JOIN
[ECSMIS].[dbo].Party p ON p.PartyID = eb.OrganizationID
WHERE     eb.event_id IN
	(SELECT     em.event_id
	FROM          event_master em JOIN
	event_master_zones emz ON emz.event_id = em.event_id
	WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
	GROUP BY em.event_id)

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
         Top = -1152
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:44:08 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrganizations]'))
DROP VIEW [dbo].[vEventOrganizations]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrganizations
AS
SELECT DISTINCT 
ISNULL(eb.OrganizationID, -1) AS OrganizationID, 
eb.event_id AS EventID, 
em.Market AS MarketID, 
eb.caller AS CallerID, 
amz.ShortName AS MarketName, 
p.Name AS OrganizationName,
(SELECT sum(dv) from event_businesses tmp WHERE tmp.OrganizationID = eb.OrganizationID AND tmp.event_id = eb.event_id) as DV,
fc.FacilityCount, 
fc.PendingCount, 
fc.ConfirmedCount, 
fc.IssueCount, 
ocs.NoteCount, 
CONVERT(VARCHAR(15), 
CAST(ocs.LastContact AS datetime), 100) AS LastContact,
(SELECT     TOP 1 CONVERT(VARCHAR(15), CAST(transfer_time AS time), 100)
	FROM          event_transfers et
	WHERE      et.OrganizationID = eb.OrganizationID AND et.event_id = eb.event_id AND et.transfer_time > DATEADD(mi, - 10, GETDATE())) 
AS TransferTime,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(tmp.status AS VARCHAR(MAX))
	FROM         event_businesses tmp
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.status FOR xml path('')), 1, 1, '')) 
AS StatusList,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(amz.ZoneShortName AS VARCHAR(MAX))
	FROM         event_businesses tmp JOIN
						 [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = tmp.FacilityZoneID
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.FacilityZoneID, amz.ZoneShortName FOR xml path('')), 1, 1, '')) 
AS ZoneList

FROM         event_businesses eb JOIN
event_master em ON em.event_id = eb.event_id LEFT JOIN
svOrgCommSummary ocs ON ocs.event_id = eb.event_id AND ocs.OrganizationID = eb.OrganizationID JOIN
svFacilityCount fc ON fc.event_id = eb.event_id AND fc.OrganizationID = eb.OrganizationID JOIN
[ECSMIS].[dbo].[vAresMarketZone] amz ON amz.MarketID = em.market JOIN
[ECSMIS].[dbo].Party p ON p.PartyID = eb.OrganizationID
WHERE     eb.event_id IN
	(SELECT     em.event_id
	FROM          event_master em JOIN
	event_master_zones emz ON emz.event_id = em.event_id
	WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
	GROUP BY em.event_id)

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
         Top = -1152
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:57:26 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrganizations]'))
DROP VIEW [dbo].[vEventOrganizations]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 11:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrganizations
AS
SELECT DISTINCT 
ISNULL(eb.OrganizationID, -1) AS OrganizationID, 
eb.event_id AS EventID, 
em.Market AS MarketID, 
eb.caller AS CallerID, 
amz.ShortName AS MarketName, 
p.Name AS OrganizationName,
(SELECT sum(dv) from event_businesses tmp WHERE tmp.OrganizationID = eb.OrganizationID AND tmp.event_id = eb.event_id) as DV,
fc.FacilityCount, 
fc.PendingCount, 
fc.ConfirmedCount, 
fc.IssueCount, 
ocs.NoteCount, 
CONVERT(VARCHAR(15), 
CAST(ocs.LastContact AS datetime), 100) AS LastContact,
(SELECT     TOP 1 CONVERT(VARCHAR(15), CAST(transfer_time AS time), 100)
	FROM          event_transfers et
	WHERE      et.OrganizationID = eb.OrganizationID AND et.event_id = eb.event_id AND et.transfer_time > DATEADD(mi, - 10, GETDATE())) 
AS TransferTime,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(tmp.status AS VARCHAR(MAX))
	FROM         event_businesses tmp
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.status FOR xml path('')), 1, 1, '')) 
AS StatusList,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(amz.ZoneShortName AS VARCHAR(MAX))
	FROM         event_businesses tmp JOIN
						 [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = tmp.FacilityZoneID
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.FacilityZoneID, amz.ZoneShortName FOR xml path('')), 1, 1, '')) 
AS ZoneList

FROM         event_businesses eb JOIN
event_master em ON em.event_id = eb.event_id LEFT JOIN
svOrgCommSummary ocs ON ocs.event_id = eb.event_id AND ocs.OrganizationID = eb.OrganizationID JOIN
svFacilityCount fc ON fc.event_id = eb.event_id AND fc.OrganizationID = eb.OrganizationID JOIN
[ECSMIS].[dbo].[vAresMarketZone] amz ON amz.MarketID = em.market JOIN
[ECSMIS].[dbo].Party p ON p.PartyID = eb.OrganizationID
WHERE     eb.event_id IN
	(SELECT     em.event_id
	FROM          event_master em JOIN
	event_master_zones emz ON emz.event_id = em.event_id
	WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
	GROUP BY em.event_id)

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
         Top = -1152
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 12:04:50 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrganizations]'))
DROP VIEW [dbo].[vEventOrganizations]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 12:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrganizations
AS
SELECT DISTINCT 
ISNULL(eb.OrganizationID, -1) AS OrganizationID, 
eb.event_id AS EventID, 
em.Market AS MarketID, 
eb.caller AS CallerID, 
amz.ShortName AS MarketName, 
p.Name AS OrganizationName,
(SELECT sum(dv) from event_businesses tmp WHERE tmp.OrganizationID = eb.OrganizationID AND tmp.event_id = eb.event_id) as DV,
fc.FacilityCount, 
fc.PendingCount, 
fc.ConfirmedCount, 
fc.IssueCount, 
ocs.NoteCount, 
CONVERT(VARCHAR(15), 
CAST(ocs.LastContact AS datetime), 100) AS LastContact,
(SELECT     TOP 1 CONVERT(VARCHAR(15), CAST(transfer_time AS time), 100)
	FROM          event_transfers et
	WHERE      et.OrganizationID = eb.OrganizationID AND et.event_id = eb.event_id AND et.transfer_time > DATEADD(mi, - 10, GETDATE())) 
AS TransferTime,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(tmp.status AS VARCHAR(MAX))
	FROM         event_businesses tmp
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.status FOR xml path('')), 1, 1, '')) 
AS StatusList,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(amz.ZoneShortName AS VARCHAR(MAX))
	FROM         event_businesses tmp JOIN
						 [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = tmp.FacilityZoneID
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.FacilityZoneID, amz.ZoneShortName FOR xml path('')), 1, 1, '')) 
AS ZoneList

FROM         event_businesses eb JOIN
event_master em ON em.event_id = eb.event_id LEFT JOIN
svOrgCommSummary ocs ON ocs.event_id = eb.event_id AND ocs.OrganizationID = eb.OrganizationID JOIN
svFacilityCount fc ON fc.event_id = eb.event_id AND fc.OrganizationID = eb.OrganizationID JOIN
[ECSMIS].[dbo].[vAresMarketZone] amz ON amz.MarketID = em.market JOIN
[ECSMIS].[dbo].Party p ON p.PartyID = eb.OrganizationID
WHERE     eb.event_id IN
	(SELECT     em.event_id
	FROM          event_master em JOIN
	event_master_zones emz ON emz.event_id = em.event_id
	WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
	GROUP BY em.event_id)

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
         Top = -1152
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 12:04:59 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrganizations]'))
DROP VIEW [dbo].[vEventOrganizations]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 12:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrganizations
AS
SELECT DISTINCT 
ISNULL(eb.OrganizationID, -1) AS OrganizationID, 
eb.event_id AS EventID, 
em.Market AS MarketID, 
eb.caller AS CallerID, 
amz.ShortName AS MarketName, 
p.Name AS OrganizationName,
(SELECT sum(dv) from event_businesses tmp WHERE tmp.OrganizationID = eb.OrganizationID AND tmp.event_id = eb.event_id) as DV,
fc.FacilityCount, 
fc.PendingCount, 
fc.ConfirmedCount, 
fc.IssueCount, 
ocs.NoteCount, 
CONVERT(VARCHAR(15), 
CAST(ocs.LastContact AS datetime), 100) AS LastContact,
(SELECT     TOP 1 CONVERT(VARCHAR(15), CAST(transfer_time AS time), 100)
	FROM          event_transfers et
	WHERE      et.OrganizationID = eb.OrganizationID AND et.event_id = eb.event_id AND et.transfer_time > DATEADD(mi, - 10, GETDATE())) 
AS TransferTime,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(tmp.status AS VARCHAR(MAX))
	FROM         event_businesses tmp
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.status FOR xml path('')), 1, 1, '')) 
AS StatusList,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(amz.ZoneShortName AS VARCHAR(MAX))
	FROM         event_businesses tmp JOIN
						 [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = tmp.FacilityZoneID
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.FacilityZoneID, amz.ZoneShortName FOR xml path('')), 1, 1, '')) 
AS ZoneList

FROM         event_businesses eb JOIN
event_master em ON em.event_id = eb.event_id LEFT JOIN
svOrgCommSummary ocs ON ocs.event_id = eb.event_id AND ocs.OrganizationID = eb.OrganizationID JOIN
svFacilityCount fc ON fc.event_id = eb.event_id AND fc.OrganizationID = eb.OrganizationID JOIN
[ECSMIS].[dbo].[vAresMarketZone] amz ON amz.MarketID = em.market JOIN
[ECSMIS].[dbo].Party p ON p.PartyID = eb.OrganizationID
WHERE     eb.event_id IN
	(SELECT     em.event_id
	FROM          event_master em JOIN
	event_master_zones emz ON emz.event_id = em.event_id
	WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
	GROUP BY em.event_id)

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
         Top = -1152
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 12:05:05 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventOrganizations]'))
DROP VIEW [dbo].[vEventOrganizations]
GO
USE [ares]
GO
/****** Object:  View [dbo].[vEventOrganizations]    Script Date: 01/06/2015 12:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.vEventOrganizations
AS
SELECT DISTINCT 
ISNULL(eb.OrganizationID, -1) AS OrganizationID, 
eb.event_id AS EventID, 
em.Market AS MarketID, 
eb.caller AS CallerID, 
amz.ShortName AS MarketName, 
p.Name AS OrganizationName,
(SELECT sum(dv) from event_businesses tmp WHERE tmp.OrganizationID = eb.OrganizationID AND tmp.event_id = eb.event_id) as DV,
fc.FacilityCount, 
fc.PendingCount, 
fc.ConfirmedCount, 
fc.IssueCount, 
ocs.NoteCount, 
CONVERT(VARCHAR(15), 
CAST(ocs.LastContact AS datetime), 100) AS LastContact,
(SELECT     TOP 1 CONVERT(VARCHAR(15), CAST(transfer_time AS time), 100)
	FROM          event_transfers et
	WHERE      et.OrganizationID = eb.OrganizationID AND et.event_id = eb.event_id AND et.transfer_time > DATEADD(mi, - 10, GETDATE())) 
AS TransferTime,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(tmp.status AS VARCHAR(MAX))
	FROM         event_businesses tmp
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.status FOR xml path('')), 1, 1, '')) 
AS StatusList,

	(SELECT DISTINCT STUFF
	((SELECT     ',' + CAST(amz.ZoneShortName AS VARCHAR(MAX))
	FROM         event_businesses tmp JOIN
						 [ECSMIS].[dbo].[vAresMarketZone] amz ON amz.ZoneID = tmp.FacilityZoneID
	WHERE     tmp.OrganizationID = eb.OrganizationID AND tmp.event_id IN
							 (SELECT     em.event_id
							   FROM          event_master em JOIN
													  event_master_zones emz ON emz.event_id = em.event_id
							   WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
							   GROUP BY em.event_id)
	GROUP BY tmp.FacilityZoneID, amz.ZoneShortName FOR xml path('')), 1, 1, '')) 
AS ZoneList

FROM         event_businesses eb JOIN
event_master em ON em.event_id = eb.event_id LEFT JOIN
svOrgCommSummary ocs ON ocs.event_id = eb.event_id AND ocs.OrganizationID = eb.OrganizationID JOIN
svFacilityCount fc ON fc.event_id = eb.event_id AND fc.OrganizationID = eb.OrganizationID JOIN
[ECSMIS].[dbo].[vAresMarketZone] amz ON amz.MarketID = em.market JOIN
[ECSMIS].[dbo].Party p ON p.PartyID = eb.OrganizationID
WHERE     eb.event_id IN
	(SELECT     em.event_id
	FROM          event_master em JOIN
	event_master_zones emz ON emz.event_id = em.event_id
	WHERE      em.status <> 0 AND em.status <> 3 AND emz.status <> 0
	GROUP BY em.event_id)

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
         Top = -1152
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEventOrganizations'
GO
