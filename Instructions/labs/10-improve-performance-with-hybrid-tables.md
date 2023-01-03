---
lab:
    title: 'Improve performance with hybrid tables'
    module: 'Optimize enterprise-scale tabular models'
---

# Improve performance with hybrid tables

## Overview

**The estimated time to complete the lab is 45 minutes**

In this lab, you will set up incremental refresh and enable a DirectQuery partition to deliver real time updates and improve refresh and query performance.

In this lab, you learn how to:

- Set up incremental refresh.

- Review table partitions.

## Get started

In this exercise, you will prepare your environment.

### Clone the repository for this course

1. On the start menu, open the Command Prompt.

    ![](../images/command-prompt.png)

1. In the command prompt window, navigate to the D drive by typing:

    `d:` 

   Press enter.

    ![](../images/command-prompt-2.png)


1. In the command prompt window, enter the following command to download the course files and save them to a folder called DP500.
    
	`git clone https://github.com/MicrosoftLearning/DP-500-Azure-Data-Analyst DP500`
   
1. When the repository has been cloned, open the D drive in the file explorer to ensure the files have been downloaded. **Close the Command Prompt** window.

### Deploy an Azure SQL Database 

In this task, you'll create an Azure SQL database that you'll use as a data source for Power BI. Running the setup script will create the Azure SQL database server and load the AdventureWorksDW2022 database.

1. To open File Explorer, on the taskbar, select the **File Explorer** shortcut.

	![](../images/dp500-improve-performance-with-hybrid-tables-image13.png)

2. Go to the **D:\DP500\Allfiles\10** folder.

3. Double click to open the **setup2.ps1** file script.
    - Read through the script in notepad if you're interested in understanding what resources the script is setting up. The lines beginning with # denote what the script is doing.
    - Close the script.

5. In the search box on the taskbar, type `PowerShell`.  
   
   When the search results appear, select **Run as administrator**
    
	![](../images/run-powershell-admin.png)
	
	*If prompted, select Yes to allow this app to make changes to your device.*
1. In PowerShell, enter the following 2 lines of text to run the script. 
	
	` cd D:\DP500\Allfiles\10`

	Press **Enter**.

	`.\setup2.ps1`
	
	Press **Enter**

    ![](../images/powershell-script.png)

2. When prompted, enter your **Azure account username**, **password**, and **resource group name**. Press **Enter**. 

    ![](../images/powershell-enter-account-info.png)

	The script will take approximately 10-15 minutes to run.

    *Note: This lab requires a resource group to create an Azure SQL database. If you are performing this lab in a hosted lab environment, you may need to log into the [Azure Portal](portal.azure.com) to obtain the resource group name. If you do not have a resource group provided in a hosted lab environment, [create a resource group](https://docs.microsoft.com/azure/azure-resource-manager/management/manage-resource-groups-portal#create-resource-groups) in your Azure subscription.*

3. After the script has completed, close the PowerShell window.

### Set up the Azure SQL Database

In this task, you will set up the Azure SQL Database to allow connections from your virtual machine's (VM's) IP address. This script will take about 10 minutes to run after you enter your username, password, and resource group.

1. In a web browser, go to [https://portal.azure.com](https://portal.azure.com/).

2. If prompted to take a tour, select **Maybe later**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image8.png)

3. Select the **SQL databases** tile.

	![](../images/dp500-improve-performance-with-hybrid-tables-image9.png)

4. In the list of SQL databases, select the **AdventureWorksDW2022-DP500** database.

5. In the action bar on the Overview tab, select **Set server firewall**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image10.png)

6. On the public access tab, select Selected networks.

7. Select **Add your client IPv4 address**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image11.png)

7. Select **Save**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image12.png)

8. Keep the Azure portal web browser session open. You will need to copy the database connection string in the **Set up Power BI Desktop task**.

### Set up Power BI

#### Set up a Power BI account in Power BI Desktop

In this task, you will set up Power BI Desktop.

1. To open File Explorer, on the taskbar, select the **File Explorer** shortcut.

	![](../images/dp500-create-a-dataflow-image1.png)

1. Go to the **D:\DP500\Allfiles\10\Starter** folder.

1. To open a pre-developed Power BI Desktop file, double-click the **Sales Analysis - Improve performance with hybrid tables** file.

1. If you're not already signed in, at the top-right corner of Power BI Desktop, select **Sign In**. Use the lab credentials to complete the sign in process.

	![](../images/dp500-create-a-dataflow-image2.png)

    *Note: this will likely take you to the Power BI service to complete the sign-up process.*

1. To save the file, on the **File** ribbon, select **Save as**.

1. In the **Save As** window, go to the **D:\DP500\Allfiles\10\MySolution** folder.

#### Set up Power BI Premium trial

In this task, you will sign in to the Power BI service and start a trial license.

*Important: If you have already setup Power BI in your VM environment, continue to the next task.*

1. In a web browser, go to [https://powerbi.com](https://powerbi.com/).

2. Use the lab credentials to complete the sign in process.

3. At the top-right, select the profile icon, and then select **Start trial**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image1.png)

4. When prompted, select **Start trial**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image2.png)

	*You require a Power BI Premium per User (PPU) license to complete this lab. A trial license is sufficient.*

5. Do any remaining tasks to complete the trial setup.

	*Tip: The Power BI web browser experience is known as the **Power BI service**.*

### Create a workspace

In this task, you will create a workspace.

1. In the Power BI service, to create a workspace, in the **Navigation** pane (located at the left), select **Workspaces**, and then select **Create workspace**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image3.png)

2. In the **Create a workspace** pane (located at the right), in the **Workspace name** box, enter a name for the workspace.

	*The workspace name must be unique within the tenant.*

	![](../images/dp500-improve-performance-with-hybrid-tables-image4.png)

3. Beneath the **Description** box, expand open the **Advanced** section.

	![](../images/dp500-improve-performance-with-hybrid-tables-image5.png)

4. Set the **License mode** option to **Premium per user**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image6.png)

	*Power BI only supports incremental refresh and hybrid tables in Premium workspaces.*

5. Select **Save**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image7.png)

	*Once created, the Power BI service opens the workspace. You will return to this workspace later in this lab.*

### Set up Power BI Desktop

In this task, you will open a pre-developed Power BI Desktop solution, set the data source settings and permissions, and then refresh the data model.

1. To open File Explorer, on the taskbar, select the **File Explorer** shortcut.

	![](../images/dp500-improve-performance-with-hybrid-tables-image13.png)

2. Go to the **D:\DP500\Allfiles\10\Starter** folder.

3. To open a pre-developed Power BI Desktop file, double-click the **Sales Analysis - Improve performance with hybrid tables.pbix** file.

4. To edit the database data source, on the **Home** ribbon tab, from inside the **Queries** group, select the **Transform data** dropdown, and then select **Data source settings**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image14.png)

5. In the **Data source settings** window, select **Change Source**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image15.png)

6. In the **SQL Server database** window, in the **Server** box, replace the text with the lab Azure SQL Database server. This is located in the Azure portal, SQL databases.

    ![](../images/dp500-improve-performance-with-hybrid-tables-image15a.png)

7. Select **OK**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image16.png)

8. Select **Edit Permissions**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image17.png)

9. In the **Edit Permissions** window, to edit the database credentials, select **Edit**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image18.png)

10. In the **SQL Server database** window, enter the SQL Server database username and password and save. 

    Username: `sqladmin`

    Password: `P@ssw0rd01`

    ![](../images/dp500-improve-performance-with-hybrid-tables-image15b.png)

11.  Select **OK**.
    ![](../images/dp500-improve-performance-with-hybrid-tables-image19.png)

12. In the **Data source settings** window, select **Close**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image20.png)

13. On the **Home** ribbon tab, from inside the **Queries** group, select **Refresh**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image21.png)

14. Wait until the data refresh completes.

15. To save the file, on the **File** ribbon tab, select **Save as**.

16. In the **Save As** window, go to the **D:\DP500\Allfiles\10\MySolution** folder.

17. Select **Save**.

18. If you're not already signed in, at the top-right corner of Power BI Desktop, select **Sign In**. Use the lab credentials to complete the sign in process.

	*Important: You must use the same credentials used to sign in to the Power BI service.*

	![](../images/dp500-improve-performance-with-hybrid-tables-image22.png)

### Review the report

In this task, you will review the pre-developed report.

1. In Power BI Desktop, review the report design.

	![](../images/dp500-improve-performance-with-hybrid-tables-image23.png)

	*The report page has a title and two visuals. The slicer visual allows filtering by a single fiscal year, while the bar chart visual displays monthly sales amounts. In this lab, you will improve the performance of the report by setting up incremental refresh and a hybrid table.*

### Review the data model

In this task, you will review the pre-developed data model.

1. Switch to **Model** view.

	![](../images/dp500-improve-performance-with-hybrid-tables-image24.png)

2. Use the model diagram to review the model design.

	![](../images/dp500-improve-performance-with-hybrid-tables-image25.png)

	*The model comprises five dimension tables and one fact table. Each table uses import storage mode. The **Sales** fact table represents sales order details. It's a classic star schema design.*

	*In this lab, you will set up the **Sales** table to use incremental refresh and become a hybrid table. A hybrid table includes a DirectQuery partition that represents the latest time period. That partition ensures current data from the data source is available in Power BI reports.*

## Set up incremental refresh

In this exercise, you will set up incremental refresh.

*Incremental refresh extends scheduled refresh operations by providing automated partition creation and management for dataset tables that frequently load new and updated data. It helps to reduce refresh time, placing lower burdens on source data and Power BI. It can also help surface current data to Power BI report more quickly.*

### Add parameters

In this task, you will add two parameters.

1. To open the Power Query Editor window, on the **Home** ribbon tab, from inside the **Queries** group, click the **Transform data** icon.

	![](../images/dp500-improve-performance-with-hybrid-tables-image26.png)

2. In the Power Query Editor window, from inside the **Queries** pane, select the **Sales** query.

	![](../images/dp500-improve-performance-with-hybrid-tables-image27.png)

3. In the preview pane, notice the **OrderDate** column, which is a date/time column.

	*Incremental refresh requires that the table contain a date column of date/time or integer data type with the value formatted as yyyymmdd.*

	*To setup incremental refresh, you must create parameters that Power BI will use to filter this column to create table partitions.*

4. To create a parameter, on the **Home** ribbon tab, select the **Manager Parameters** icon.

	![](../images/dp500-improve-performance-with-hybrid-tables-image28.png)

5. In the **Manage Parameters** window, select **New**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image29.png)

6. In the **Name** box, replace the text with **RangeStart**.

7. In the **Type** dropdown list, select **Date/Time**.

8. In the **Current Value** box, enter **6/1/2022** (June 1, 2022 - the VM uses US date formats). 

    *Note that for non-MM-DD-YYY format locations, the date should be entered as 1/6/2022*

	*While setting up the parameters, you can use arbitrary values. Power BI will update parameter values when it creates and manages the partitions. In this lab, you'll set a range for the month of June 2022.*

	![](../images/dp500-improve-performance-with-hybrid-tables-image30.png)

9. To create a second parameter, select **New**.

10. Set the following parameter properties:

	- Name: **RangeEnd**

	- Type: **Date/Time**

	- Current Value: **7/1/2022** (July 1, 2022)

     *Note that for non-MM-DD-YYY format locations, the date should be entered as 1/7/2022*

	![](../images/dp500-improve-performance-with-hybrid-tables-image31.png)

11. Select **OK**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image32.png)

### Filter the query

In this task, you will add filters to the **Sales** query.

1. In the **Queries** pane, select the **Sales** query.

2. In the header of the **OrderDate** column, select the down arrow, and then select **Date/Time Filters** > **Between**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image33.png)

3. In the **Filter Rows** window, select the first calendar icon dropdown list, and then select **Parameter**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image34.png)

4. In the adjacent dropdown list, notice that the **RangeStart** parameter is set.

	*The default parameter selection is the correct one.*

5. In the second "range" dropdown list, select **is before**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image35.png)

6. In the corresponding dropdown lists, select the **RangeEnd** parameter.

	![](../images/dp500-improve-performance-with-hybrid-tables-image36.png)

7. Select **OK**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image37.png)

8. On the **Home** ribbon tab, from inside the **Close** group, click the **Close &amp; Apply** icon.

	![](../images/dp500-improve-performance-with-hybrid-tables-image38.png)

9. Notice that Power BI Desktop loaded 5,134 rows into the **Sales** table.

	![](../images/dp500-improve-performance-with-hybrid-tables-image39.png)

	*These are the filtered rows for the June 2022.*

10. Save the Power BI Desktop file.

	![](../images/dp500-improve-performance-with-hybrid-tables-image40.png)

### Set up incremental refresh

In this task, you will set up the incremental refresh policy for the **Sales** table.

1. In the model diagram, right-click the **Sales** table header, and then select **Incremental refresh**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image41.png)

2. In the **Incremental refresh and real-time data** window, at step 2, turn on incremental refresh.

	![](../images/dp500-improve-performance-with-hybrid-tables-image42.png)

3. Set the following: Archive data starting **2 Years** before refresh date.

	![](../images/dp500-improve-performance-with-hybrid-tables-image43.png)

	*This setting determines the historical period. In this instance, Power BI will create two whole-year partitions for historic data.*

4. Set the following: Incrementally refresh data starting **7 Days** before refresh date.

	![](../images/dp500-improve-performance-with-hybrid-tables-image44.png)

	*This setting determines the incremental refresh period in which all rows with a date/time in that period are included in the refresh partition(s) and refreshed with each refresh operation.*

5. At step 3, check the **Get the latest data in real time with DirectQuery** option.

	![](../images/dp500-improve-performance-with-hybrid-tables-image45.png)

	*This setting enables fetching the latest changes from the selected table at the data source beyond the incremental refresh period by using DirectQuery. All rows with a date/time later than the incremental refresh period are included in a DirectQuery partition and fetched from the data source with every dataset query. This setting makes the table a hybrid table because it will contain import partitions and one DirectQuery partition.*

6. Select **Apply**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image46.png)

7. Save the Power BI Desktop file.

	![](../images/dp500-improve-performance-with-hybrid-tables-image47.png)

### Publish the dataset

In this task, you will publish the dataset.

1. To publish the report, on the **Home** ribbon tab, select **Publish**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image48.png)

2. In the **Publish to Power BI** window, select the workspace created in this lab, and then select.

	![](../images/dp500-improve-performance-with-hybrid-tables-image49.png)

3. When the publishing succeeds, select **Got it**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image50.png)

4. Close Power BI Desktop.

5. If prompted to save changes, select **Save**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image51.png)

### Set up the dataset

In this task, you will set up the data source credentials and refresh the dataset.

1. Switch to the Power BI service web browser session.

2. In the workspace landing page, locate the report and dataset.

	![](../images/dp500-improve-performance-with-hybrid-tables-image52.png)

3. Hover the cursor over the dataset, and when the ellipsis appears, select the ellipsis, and then select **Settings**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image53.png)

4. In the **Data source credentials** section, select the **Edit credentials** link.

	![](../images/dp500-improve-performance-with-hybrid-tables-image54.png)

5. In the window, enter the username and password, and set the privacy level to Organizational.
       
	Username: `sqladmin`

    Password: `P@ssw0rd01`

	![](../images/dp500-improve-performance-with-hybrid-tables-image54b.png)

6. Select **Sign In**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image55.png)

8. Expand open the **Scheduled refresh and performance optimization** section.

	![](../images/dp500-improve-performance-with-hybrid-tables-image56.png)

9. Notice, but do not change, any of the settings.

	*In a real world set up, you schedule data refresh to allow Power BI to refresh and manage the partitions on a recurring basis.*

	*In this lab, you will do an on-demand refresh.*

10. In the **Navigation** pane (located at the left), select your workspace.

11. In the workspace landing page, hover the cursor over the dataset, and then select the **Refresh** icon.

	![](../images/dp500-improve-performance-with-hybrid-tables-image57.png)

12. In the **Refreshed** column, notice the spinning icon, and wait until it stops (indicating that the refresh has completed).

	![](../images/dp500-improve-performance-with-hybrid-tables-image58.png)

13. To open the workspace settings, at the top right, select **Settings**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image59.png)

14. In the **Settings** pane, select the **Premium** tab.

	![](../images/dp500-improve-performance-with-hybrid-tables-image60.png)

15. To copy the workspace connection to the clipboard, select **Copy**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image61.png)

	*You will use the workspace connection to connect to it in SQL Server Management Studio (SSMS).*

16. To close the pane, select **Cancel**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image62.png)

### Review the table partitions

In this task, you will use SSMS to review the table partitions.

1. To open SSMS, on the taskbar, select the **SSMS** shortcut.

	![](../images/dp500-improve-performance-with-hybrid-tables-image63.png)

2. In the **Connect to Server** window, in the **Server type** dropdown list, select **Analysis Services**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image64.png)

	*You can use SSMS to connect to the workspace by using the XMLA read/write endpoint. The endpoint is only available for Premium workspaces.*

3. In the **Server name** box, replace the text by pasting in the workspace connection (press **Ctrl+V**).

4. In the **Authentication** dropdown list, select **Azure Active Directory - Password**.

5. Enter your lab credentials.

6. Select **Connect**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image65.png)

7. In Object Explorer (located at the left), expand open the **Databases** folder, expand open the **Sales Analysis...** database (dataset), and then the **Tables** folder.

	![](../images/dp500-improve-performance-with-hybrid-tables-image66.png)

8. Right-click the **Sales** table, and then select **Partitions**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image67.png)

9. In the **Partitions** window, notice the list of partitions for the two years history, followed by quarterly partitions and daily partitions.

10. Scroll to the bottom of the list, and notice the last one is a DirectQuery partition for the current and future dates.

	*Power BI creates and manages all of these partitions automatically.*

11. Select **Cancel**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image68.png)

## Test the hybrid table

In this exercise, you will open the report, add a sales order, and then see the report data update.

### Open the report

In this task, you will open the report.

1. Switch to the Power BI service web browser session.

2. In the workspace landing page, select the report.

	![](../images/dp500-improve-performance-with-hybrid-tables-image69.png)

3. If necessary, in the **Fiscal Year** slicer, select the fiscal year that contains the current month (based on today's date).

    *The current month should be visible as a bar in the bar chart.*

    *Note that August 2022 onwards is not in FY 2022, which is the default for the slicer.*

### Add an order to the database

In this task, you will add an order to the database.

1. Switch to SSMS.

2. To open a script file, on the **File** menu, select **Open** > **File**.

3. In the **Open File** window, go to the **D:\DP500\Allfiles\10\Assets** folder.

4. Select the **1-InsertOrder.sql** file and select **Open**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image70.png)

5. In the **Connect to Database Engine** window, ensure that the **Server name** dropdown list is set to the lab Azure SQL Database server.

6. In the **Authentication** dropdown list, select **SQL Server Authentication**.

7. Enter the user name **sqladmin** and password.

8. Select **Connect**.

	![](../images/dp500-improve-performance-with-hybrid-tables-image71.png)

9. Review the script.

	*This script inserts a single order into the **FactInternetSales** table using today as the order date.*

10. To run a script, on the toolbar, select **Execute** (or press **F5**).

	![](../images/dp500-improve-performance-with-hybrid-tables-image72.png)

11. To close the file, on the **File** menu, select **Close**.

### Refresh the report

In this task, you will refresh the report.

1. Switch to the Power BI service web browser session.

2. In the report, take note of the sales amount for the current month.

3. On the action bar, select the **Refresh** command.

	![](../images/dp500-improve-performance-with-hybrid-tables-image73.png)

4. When the report refresh completes, verify that the sales amount for the current month increased by $10,000 dollars.

	*When Power BI queried the **Sales** table, it retrieved current data from the DirectQuery partition, which queried the Azure SQL database directly.*

	*Tip: Hybrid tables work especially well with automatic page refresh, which is a feature that automatically refreshes a Power BI report.*

### Finish up

In this task, you will finish up. Open SSMS and ensure you're connected to the database, AdventureWorksDW2022-DP500.

1. In SSMS, open the **2-Cleanup.sql** file.

	![](../images/dp500-improve-performance-with-hybrid-tables-image74.png)

	This script removes the order that you inserted.

2. Run the script.

3. Close SSMS.
