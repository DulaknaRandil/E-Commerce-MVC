
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/06/2024 22:39:57
-- Generated from EDMX file: C:\Users\randi\Downloads\WebApplication1\WebApplication1\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [dbemarketing];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__tbl_categ__cat_f__276EDEB3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_category] DROP CONSTRAINT [FK__tbl_categ__cat_f__276EDEB3];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_produ__pro_f__2E1BDC42]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_product] DROP CONSTRAINT [FK__tbl_produ__pro_f__2E1BDC42];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_produ__pro_f__2F10007B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_product] DROP CONSTRAINT [FK__tbl_produ__pro_f__2F10007B];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[tbl_admin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_admin];
GO
IF OBJECT_ID(N'[dbo].[tbl_category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_category];
GO
IF OBJECT_ID(N'[dbo].[tbl_product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_product];
GO
IF OBJECT_ID(N'[dbo].[tbl_user]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_user];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tbl_admin'
CREATE TABLE [dbo].[tbl_admin] (
    [ad_id] int IDENTITY(1,1) NOT NULL,
    [ad_username] nvarchar(50)  NOT NULL,
    [ad_password] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'tbl_category'
CREATE TABLE [dbo].[tbl_category] (
    [cat_id] int IDENTITY(1,1) NOT NULL,
    [cat_name] nvarchar(50)  NOT NULL,
    [cat_image] nvarchar(max)  NOT NULL,
    [cat_fk_ad] int  NULL,
    [cat_status] int  NULL
);
GO

-- Creating table 'tbl_product'
CREATE TABLE [dbo].[tbl_product] (
    [pro_id] int IDENTITY(1,1) NOT NULL,
    [pro_name] nvarchar(50)  NOT NULL,
    [pro_image] nvarchar(max)  NOT NULL,
    [pro_des] nvarchar(max)  NOT NULL,
    [pro_price] int  NULL,
    [pro_fk_cat] int  NULL,
    [pro_fk_user] int  NULL
);
GO

-- Creating table 'tbl_user'
CREATE TABLE [dbo].[tbl_user] (
    [u_id] int IDENTITY(1,1) NOT NULL,
    [u_name] nvarchar(50)  NOT NULL,
    [u_email] nvarchar(50)  NOT NULL,
    [u_password] nvarchar(50)  NOT NULL,
    [u_image] nvarchar(max)  NOT NULL,
    [u_contact] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ad_id] in table 'tbl_admin'
ALTER TABLE [dbo].[tbl_admin]
ADD CONSTRAINT [PK_tbl_admin]
    PRIMARY KEY CLUSTERED ([ad_id] ASC);
GO

-- Creating primary key on [cat_id] in table 'tbl_category'
ALTER TABLE [dbo].[tbl_category]
ADD CONSTRAINT [PK_tbl_category]
    PRIMARY KEY CLUSTERED ([cat_id] ASC);
GO

-- Creating primary key on [pro_id] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [PK_tbl_product]
    PRIMARY KEY CLUSTERED ([pro_id] ASC);
GO

-- Creating primary key on [u_id] in table 'tbl_user'
ALTER TABLE [dbo].[tbl_user]
ADD CONSTRAINT [PK_tbl_user]
    PRIMARY KEY CLUSTERED ([u_id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [cat_fk_ad] in table 'tbl_category'
ALTER TABLE [dbo].[tbl_category]
ADD CONSTRAINT [FK__tbl_categ__cat_f__276EDEB3]
    FOREIGN KEY ([cat_fk_ad])
    REFERENCES [dbo].[tbl_admin]
        ([ad_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_categ__cat_f__276EDEB3'
CREATE INDEX [IX_FK__tbl_categ__cat_f__276EDEB3]
ON [dbo].[tbl_category]
    ([cat_fk_ad]);
GO

-- Creating foreign key on [pro_fk_cat] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [FK__tbl_produ__pro_f__2E1BDC42]
    FOREIGN KEY ([pro_fk_cat])
    REFERENCES [dbo].[tbl_category]
        ([cat_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_produ__pro_f__2E1BDC42'
CREATE INDEX [IX_FK__tbl_produ__pro_f__2E1BDC42]
ON [dbo].[tbl_product]
    ([pro_fk_cat]);
GO

-- Creating foreign key on [pro_fk_user] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [FK__tbl_produ__pro_f__2F10007B]
    FOREIGN KEY ([pro_fk_user])
    REFERENCES [dbo].[tbl_user]
        ([u_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_produ__pro_f__2F10007B'
CREATE INDEX [IX_FK__tbl_produ__pro_f__2F10007B]
ON [dbo].[tbl_product]
    ([pro_fk_user]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------