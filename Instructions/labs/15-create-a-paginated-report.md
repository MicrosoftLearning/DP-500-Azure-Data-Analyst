# Create a paginated report

## Overview

**The estimated time to complete the lab is 45 minutes**

In this lab, you will use Power BI Report Builder to develop a pixel-perfect paginated report layout that sources data from the **AdventureWorksDW2022-DP500** SQL Server database. You will then create a data source and dataset, and also configure a report parameter. The report layout will allow data to render over multiple pages and to be exported in PDF and other formats.

The final report will look like the following:

![](../images/dp500-create-a-paginated-report-image1.png)

In this lab, you learn how to:

- Use Power BI Report Builder

- Design a multi-page report layout

- Define a data source

- Define a dataset

- Create a report parameter

- Export a report to PDF

## Get started

In this exercise, you will open Power BI Report Builder to create and then save a report.

### Clone the repository for this course

1. On the start menu, open the Command Prompt

    ![](../images/command-prompt.png)

1. In the command prompt window, navigate to the D drive by typing:

    `d:` 

   Press enter.

    ![](../images/command-prompt-2.png)


1. In the command prompt window, enter the following command to download the course files and save them to a folder called DP500.
    
	`git clone https://github.com/MicrosoftLearning/DP-500-Azure-Data-Analyst DP500`
   
1. When the repository has been cloned, close the command prompt window. 
   
1. Open the D drive in the file explorer to ensure the files have been downloaded.

### Create the report

In this task, you will open Power BI Report Builder to create and then save a report.

1. To open Power BI Report Builder, on the taskbar, select the **Power BI Report Builder** shortcut.

	![](../images/dp500-create-a-paginated-report-image2.png)

1. If you are prompted to update to the latest version of Power BI report Builder, select **Cancel**.

2. In the Power BI Report Builder window, to create a new report, in the **Getting Started** window, select **Blank Report**.

	![](../images/dp500-create-a-paginated-report-image3.png)

  
3. To save the report, select the **File** tab (located at the top-left), and then select **Save**.

	![](../images/dp500-create-a-paginated-report-image4.png)

4. In the **Save As Report** window, navigate to the **D:\DP500\Allfiles\15\MySolution** folder.

5. In the **Name** box, enter **Sales Order Report**.

6. Select **Save**.

## Develop the report layout

In this exercise, you will develop the report layout, and then explore the final report design.

### Configure the report header

In this task, you will configure the report header.

1. In the report designer, notice the default report layout, which consists of a body region and a report footer region.

	![](../images/dp500-create-a-paginated-report-image5.png)

	*The body contains a single textbox ready for a report title, and the report footer contains a single textbox describing the report execution time.*

	*The default design will render the report title once, in the body, on the first rendered page. However, you will now modify the report design by adding a report header region, and by moving the report title textbox into this region. This way, the report title will repeat on every page. You will also add an image of the company logo.*

2. To add a report header region, on the **Insert** ribbon tab, from inside the **Header &amp; Footer** group, open **Header**, and then select **Add Header**.

	![](../images/dp500-create-a-paginated-report-image6.png)

3. In the report designer, notice that a report header region has been added to the report layout.

4. To select the body textbox, select the "Click to add title" textbox.

5. To move the textbox, select the four-headed arrow icon, and then drag it into the header region to then drop it at the very top-left of the report header region.

	![](../images/dp500-create-a-paginated-report-image7.png)

6. To modify the report title textbox text, select inside the text box, and then enter: **Sales Order Report**

	*To resize the textbox, you will first open the **Properties** pane. For fine-grained control of location and size properties, you will need use the **Properties** pane.*

7. On the **View** ribbon tab, from inside the **Show/Hide** group, select **Properties**.

	![](../images/dp500-create-a-paginated-report-image8.png)

8. To focus on the report title textbox, first select an area outside the textbox, and then select the textbox again.

	*The textbox is selected when you see the border of the textbox highlighted and resizing handles (small circles) appear on the border.*

9. In the **Properties** pane (located at the right), scroll down the list to locate the **Position** group.

	![](../images/dp500-create-a-paginated-report-image9.png)

	*The **Position** group allows setting exact values for the location and size of report items.*

	*Important: Enter the values as directed in this lab. Pixel-perfect layout is required to achieve the page rendering at the end of the lab.*

10. Within the **Position** group, expand the **Location** group, and ensure that the **Left** and **Top** properties are each set to **0in**.

	*The location and size units are in inches because the regional settings of the lab virtual machine is set to the United States. If your region uses metric measurements, centimeters would be the default unit.*

11. Within the **Position** group, expand the **Size** group, and then set the **Width** property to **4**.

	![](../images/dp500-create-a-paginated-report-image10.png)


12. To insert an image, on the **Insert** ribbon tab, from inside the **Report Items** group, select **Image**.

	![](../images/dp500-create-a-paginated-report-image11.png)

13. To add the image to the report design, select the area inside the report header region, to the right of the report title textbox.

14. In the **Image Properties** window, to import from an image file, select **Import**.

	![](../images/dp500-create-a-paginated-report-image12.png)

15. In the **Open** window, navigate to the **D:\DP500\Allfiles\15\Assets** folder, and then select the **AdventureWorksLogo.jpg** file.

16. Select **Open**.

17. In the **Image Properties** window, select **OK**.

18. In the report designer, notice that the image was added, and is in focus.

 

19. To position and resize the image, in the **Properties** pane, configure the following properties:

	|  **Property** | **Value** |
	|--- | --- |
	|  Position > Location > Left| 5 |
	|  Position > Location > Top| 0 |
	|  Position > Size > Width| 1 |
	|  Position > Size > Height| 1 |



20. To resize the report header region, first set focus to the region by selecting a blank area within it.

21. In the **Properties** pane, set the **General** > **Height** property to **1**.

22. Verify that the report header region contains a single textbox and image, and looks like the following:

	![](../images/dp500-create-a-paginated-report-image13.png)

23. To save the report, on the **File** tab, select **Save**.

	*Tip: You can also select the disk icon located at the top-left.*

	![](../images/dp500-create-a-paginated-report-image14.png)

	*You are now ready to configure the report to retrieve a database query result.*


### Retrieve data

In this task, you will create a data source and dataset to retrieve a query result from the **AdventureWorksDW2022-DP500** SQL Server database.

1. In the **Report Data** pane (located at the left), right-click the **Data Sources** folder, and then select **Add Data Source**.

	![](../images/dp500-create-a-paginated-report-image15.png)

	*It's possible to retrieve data from cloud or on-premises databases, or a Power BI dataset.*

2. In the **Data Source Properties** window, in the **Name** box, replace the text with **AdventureWorksDW2022**.

3. In the **Select Connection Type** dropdown list, notice that **Microsoft SQL Server** is selected.

4. To build the connection string, select **Build**.

	![](../images/dp500-create-a-paginated-report-image16.png)


5. In the **Connection Properties** window, in the **Server Name** box, enter **localhost**.

	*In this lab, you will connect to the SQL Server database by using **localhost**. However, it's not a recommended practice when creating your own solutions because gateway data sources cannot resolve **localhost**.*

6. In the **Select or Enter a Database Name** dropdown list, select the **AdventureWorksDW2022-DP500** database.

7. Select **OK**.

8. In the **Data Source Properties** window, select **OK**.

9. In the **Report Data** pane, notice the addition of the **AdventureWorksDW2022** data source.

	![](../images/dp500-create-a-paginated-report-image17.png)

10. To create a dataset, in the **Report Data** pane, right-click the **AdventureWorksDW2022** data source, and then select **Add Dataset**.

	![](../images/dp500-create-a-paginated-report-image18.png)

	*A report dataset is a different in purpose and structure from a Power BI dataset.*

11. In the **Dataset Properties** window, in the **Name** box, replace the text with **SalesOrder**.


12. To import a pre-defined query, select **Import**.

	![](../images/dp500-create-a-paginated-report-image19.png)

13. In the **Import Query** window, navigate to the **D:\DP500\Allfiles\15\Assets** folder, and then select the **SalesOrder.sql** file.

14. Select **Open**.

15. In the **Query** box, review the query, and be sure to scroll down to the bottom of the query text.

	*It's not important that you understand the details of the query statement. It has been designed to retrieve sales order line details. The WHERE clause includes a predicate to restrict the query result to a single sales order. The ORDER BY clause ensures the rows are returned by line number order.*

16. Notice the use of **@SalesOrderNumber** in the WHERE clause, which represents a query parameter.

	![](../images/dp500-create-a-paginated-report-image20.png)

	*A query parameter is a placeholder for a value that will be passed in at query execution time. You will configure a report parameter to prompt the report user for a single sales order number which will then be passed to the query parameter.*

17. Select **OK**.



18. In the **Report Data** pane, notice the addition of the **SalesOrder** dataset and its fields.

	![](../images/dp500-create-a-paginated-report-image21.png)

	*Fields are used to configure data regions in the report layout. They were derived from the dataset query columns.*

19. Save the report.

### Configure the report parameter

In this task, you will configure the report parameter with a default value.

1. In the **Report Data** pane, expand the **Parameters** folder to reveal the **SalesOrderNumber** report parameter.

	![](../images/dp500-create-a-paginated-report-image22.png)

	*The **SalesOrderNumber** report parameter was added automatically when the dataset was created. It's because the dataset query included the **@SalesOrderNumber** query parameter.*

2. To edit the report parameter, right-click the **SalesOrderNumber** report parameter, and then select **Parameter Properties**.

	![](../images/dp500-create-a-paginated-report-image23.png)

3. In the **Report Parameter Properties** window, at the left, select the **Default Values** pages.

	![](../images/dp500-create-a-paginated-report-image24.png)

4. Select the **Specify Values** option.

	![](../images/dp500-create-a-paginated-report-image25.png)

5. To add a default value, select **Add**.


6. In the **Value** dropdown list, replace the text with **43659**.

	![](../images/dp500-create-a-paginated-report-image26.png)

	*Sales order 43659 is the value you will initially use to test the report design.*

7. Select **OK**.

8. Save the report.

	*You will now complete the report header region design by adding textboxes to describe the sales order.*

### Finalize the report header layout

In this task, you will finalize the report header region design by adding textboxes.

1. To add a textbox to the report header region, on the **Insert** ribbon tab, from inside the **Report Items** group, select **Text Box**.

	![](../images/dp500-create-a-paginated-report-image27.png)

2. Select inside the report header region, directly beneath the report title textbox.

3. Inside the new textbox, enter **Sales Order:** followed by a space.

4. To insert a place holder, immediately after the space just entered, right-click and then select **Create Placeholder**.

	![](../images/dp500-create-a-paginated-report-image28.png)


5. In the **Placeholder Properties** window, at the right of the **Value** dropdown list, select the **fx** button.

	![](../images/dp500-create-a-paginated-report-image29.png)

	*The **fx** button allows entering a custom expression. This expression will be used to return the sales order number.*

6. In the **Expression** window, in the **Category** list, select **Parameters**.

	![](../images/dp500-create-a-paginated-report-image30.png)

7. In the **Values** list, double-click the **SalesOrderNumber** parameter.

8. In the expression box, notice that a programmatic reference to the **SalesOrderNumber** report parameter was added.

	![](../images/dp500-create-a-paginated-report-image31.png)

9. Select **OK**.

10. In the **Placeholder Properties** window, select **OK**.

11. Select a blank area of the report header region, and then select the new textbox.

12. In the **Properties** pane, configure the following position properties:

	|  **Property**| **Value** |
	| --- | --- |
	|  Position > Location > Left| 0 |
	|  Position > Location > Top| 0.5 |
	|  Position > Size > Width| 4 |
	|  Position > Size > Height| 0.25 |


13. To format part of the textbox text, inside the new textbox, select only the **Sales Order:** text.

	![](../images/dp500-create-a-paginated-report-image32.png)

14. On the **Home** ribbon tab, from inside the **Font** group, select the **Bold** command.

	![](../images/dp500-create-a-paginated-report-image33.png)

15. Add another textbox to the report header region, and then enter the text **Reseller:** followed by a space.

	*Tip: You can also add a textbox by right-clicking the canvas, and then selected **Insert** > **Text Box**.*

16. After the space, insert a placeholder, and then set the value of the placeholder to use an expression.


17. In the **Expression** window, in the **Category** list, select **Datasets**.

	![](../images/dp500-create-a-paginated-report-image34.png)

18. Base the expression value on **First(Reseller)** value.

19. In the **Properties** pane, configure the following position properties:

	|  **Property**| **Value** |
	| --- | --- |
	|  Position > Location > Left| 0 |
	|  Position > Location > Top| 0.75 |
	|  Position > Size > Width| 4 |
	|  Position > Size > Height| 0.25 |


20. Format the **Reseller:** text as bold.

21. Add a third (and last) textbox to the report header region, and then enter the text **Order Date:** followed by a space.

22. After the space, insert a placeholder, and set the value of the placeholder to use an expression based on the **Datasets** category, **First(OrderDate)** value.

	![](../images/dp500-create-a-paginated-report-image35.png)


23. To format the date value, in the **Placeholder Properties** window, select the **Number** page.

	![](../images/dp500-create-a-paginated-report-image36.png)

24. In the **Category** list, select **Date**.

	![](../images/dp500-create-a-paginated-report-image37.png)

25. In the **Type** list, select a suitable date format type.

26. In the **Placeholder Properties** window , select **OK**.

27. In the **Properties** pane, configure the following position properties:

	|  **Property**| **Value** |
	| --- | --- |
	|  Position > Location > Left| 0 |
	|  Position > Location > Top| 1 |
	|  Position > Size > Width| 4 |
	|  Position > Size > Height| 0.25 |


28. Format the **Order Date:** text as bold.

29. Finally, select a blank area of the report header region.

30. In the **Properties** pane, set the **Height** property to **1.5**.


31. Verify that the report header region looks like the following:

	![](../images/dp500-create-a-paginated-report-image38.png)

32. Save the report.

33. To preview the report, on the **Home** ribbon tab, from inside the **Views** group, select **Run**.

	![](../images/dp500-create-a-paginated-report-image39.png)

	*Running the report renders the report in HTML format. As the only report parameter has a default value, the report will run automatically.*

34. Verify that the rendered report looks like the following:

	![](../images/dp500-create-a-paginated-report-image40.png)


35. To return to design view, on the **Run** ribbon tab, from inside the **Views** group, select **Design**.

	![](../images/dp500-create-a-paginated-report-image41.png)

	*You will now add a table to the report body to display a formatted layout of the sales order lines.*

### Add a table data region

In this task, you will add a table data region to the report body.

1. On the **Insert** ribbon tab, from inside the **Data Regions** group, open **Table**, and then select **Insert Table**.

	![](../images/dp500-create-a-paginated-report-image42.png)

2. To add the table, select a blank area inside the report body.

3. In the **Properties** pane, configure the following position properties:

	|  **Property**| **Value** |
	| --- | --- |
	|  Position > Location > Left| 0 |
	|  Position > Location > Top| 0 |


	*The table will display five columns. By default, the table template includes only three columns.*


4. To add a column to the table, right-click inside any cell of the last column, and then select **Insert Column** > **Right**.

	![](../images/dp500-create-a-paginated-report-image43.png)

5. Repeat the last step to add a second new column.

6. Hover the cursor over the cell in the second row of the first column to reveal the field picker icon.

	![](../images/dp500-create-a-paginated-report-image44.png)

7. Select the field picker icon, and then select the **Line** field.

	![](../images/dp500-create-a-paginated-report-image45.png)

8. Notice that the table now includes a text value in the first row (header), and a field reference in the detail row.

	![](../images/dp500-create-a-paginated-report-image46.png)

9. Add fields to the next four columns, in order, as follows:

	- Product

	- Quantity

	- UnitPrice

	- Amount

10. Verify that the table design looks like the following:

	![](../images/dp500-create-a-paginated-report-image47.png)

11. Save the report.

12. Preview the report.

	![](../images/dp500-create-a-paginated-report-image48.png)

	![](../images/dp500-create-a-paginated-report-image49.png)

	*The table includes a header and 12 sales order line rows. There are many improvements that can be made by formatting the table layout.*

	*In the next task you will:*

	- *Format the table header by using a background color and bold font style*

	- *Modify column widths to remove redundant space and to prevent long text values from wrapping*

	- *Left-justify the first column values*

	- *Right-justify the last three column values*

	- *Format currency values using a currency symbol (for USD)*

	- *Add and format a total row for the table*


### Format the table data region

In this task, you will format the table data region.

1. Return to design view.

2. Select any cell in the table to reveal the gray cell guides (located across the top and at the left side of the data region).

	![](../images/dp500-create-a-paginated-report-image50.png)

	*The cell guides are there to help you configure entire rows or columns.*

3. To format the table header, select the header row guide.

	![](../images/dp500-create-a-paginated-report-image51.png)

	*Selecting a row or a column guide selects all cells in the row or column. Each cell is in fact a textbox. Formatting single textbox-or a multi-selection of textboxes-can then be achieved by using the **Properties** pane, or the ribbon commands.*

4. In the **Properties** pane (or the ribbon), configure the following properties:

	|  **Property**| **Value** |
	| --- | --- |
	|  Fill > BackgroundColor| DarkGreen (tip: hover the cursor over each color to reveal its name) |
	|  Font > Color| White |
	|  Font > Font > FontWeight| Bold |


5. Select the first column guide.

	![](../images/dp500-create-a-paginated-report-image52.png)

6. In the **Properties** pane, set the **Position** > **Size** > **Width** property to **0.5**.

7. Set the width of the second column to **2.5**.

8. Select the **Quantity** column guide, and then while pressing the **Ctrl** key, select also the last two column header guides (**Unit Price** and **Amount**).

9. In the **Properties** pane (or ribbon), set the **Alignment** > **TextAlign** property to **Right**.

10. Set the **Line** detail textbox to left align.

	![](../images/dp500-create-a-paginated-report-image53.png)

11. On the **Home** ribbon tab, from inside the **Number** group, set the last two detail (not header) textboxes (**UnitPrice** and **Amount**) to format with a currency symbol.

	![](../images/dp500-create-a-paginated-report-image54.png)

	![](../images/dp500-create-a-paginated-report-image55.png)


12. To add a total row to the table, right-click the **Quantity** detail textbox, and then select **Add Total**.

	![](../images/dp500-create-a-paginated-report-image56.png)

13. Notice that a new row, which represents the table footer, has been added, and that the expression will evaluate the sum of **Quantity** values.

14. Repeat the last step to add a total for the **Amount** detail textbox.

15. In the first cell of the table footer row, enter the word **Total**.

16. Format all textboxes in the footer row to format as bold.

17. Verify that the table design looks like the following:

	![](../images/dp500-create-a-paginated-report-image57.png)


18. To remove any trailing space after the table, hover the cursor over the dashed line between the report body and report footer region, and then drag upwards to touch the bottom of the table.

	![](../images/dp500-create-a-paginated-report-image58.png)

19. Save the report

20. Preview the report.

21. Verify that the rendered report looks like the following:

	![](../images/dp500-create-a-paginated-report-image59.png)

22. In the **Sales Order Number** parameter box, replace the value with **51721**.

	![](../images/dp500-create-a-paginated-report-image60.png)

23. To re-run the report, at the right, select **View Report**.

	![](../images/dp500-create-a-paginated-report-image61.png)

	*This sales order has 72 sales order lines, and so the data will render over many pages.*

24. To navigate to the second page of the report, on the **Run** ribbon tab, from inside the **Navigation** group, select **Next**.

	![](../images/dp500-create-a-paginated-report-image62.png)

25. On page 2, notice that the table header does not appear.

	*You will address this issue in the next task.*

26. Scroll to the bottom of the page, and then notice that the report footer displays only the execution time.

	*In the next task, you will improve the footer text by appending the page number.*

### Finalize the report design

In this task, you will finalize the report design by ensuring multi-page reports render appropriately.

1. Switch to the design view.

2. To ensure the table header repeats on all pages, first select any textbox of the table.

3. In the **Grouping** pane (located along the bottom of the report designer), at the far right of the **Column Groups**, select the down-arrow, and then select **Advanced Mode**.

	![](../images/dp500-create-a-paginated-report-image63.png)

4. In the **Row Groups** section, select the first static group.

	![](../images/dp500-create-a-paginated-report-image64.png)

	*This selected the table header row.*

5. In the **Properties** pane, set the **Other** > **RepeatOnNewPage** property to **True**.

	*This ensures that the first static group (representing the table header) will repeat on all pages.*

6. In the table footer region, right-click the **ExecutionTime** textbox, and then select **Expression**.

	![](../images/dp500-create-a-paginated-report-image65.png)

7. In the **Expression** window, in the expression box, append a space, followed by **&amp; " | Page " &amp;**, to produce the following expression:


	```
	=Globals!ExecutionTime & " | Page " &
	```


8. Ensure that a space follows the last ampersand (&).

9. In the **Category** list, select **Built-in Fields**.

	![](../images/dp500-create-a-paginated-report-image66.png)

10. To inject the page number value into the expression, in the **Item** list, double-click **PageNumber**.

11. Verify that the complete expression reads as follows:

	![](../images/dp500-create-a-paginated-report-image67.png)

12. Select **OK**.

13. Drag the left side of the textbox to increase the width to the width of the report page.

	![](../images/dp500-create-a-paginated-report-image68.png)

	*The design of the report is now complete. Lastly, you will ensure that the page width is set to exactly six inches, and also remove the report parameter default value.*

14. To select the report body, right-click any table textbox, and then select **Select** > **Body**.

	![](../images/dp500-create-a-paginated-report-image69.png)

	*As the table fills the entire report body, this technique must be used to select the report body.*

15. In the **Properties** pane, ensure that the **Position** > **Size** > **Width** property is set to **6**.

	*It's important the width is not greater than six inches, as rendering to print format would break the table up across multiple pages.*

16. In the **Report Data** pane, open the **SalesOrderNumber** report parameter properties.

17. On the **Default Values** page, select the **No Default Value** option.

	![](../images/dp500-create-a-paginated-report-image70.png)

18. Select **OK**.

19. Save the report.

  

### Explore the completed report

In this task, you will view the report in print layout mode.

1. Preview the report.

2. In the **Sales Order Number** parameter box, enter the value with **51721**

3. On the **Run** ribbon tab, from inside the **Print** group, select **Print Layout**.

	![](../images/dp500-create-a-paginated-report-image71.png)

	*Print layout mode provides a preview of what the report will look like when printed to the strict page size.*

4. Navigate to pages 2 and 3.

	*In this lab, you won't publish the report. Note that paginated reports can only be rendered in the Power BI service when they are stored in a workspace that has its license mode set to **Premium per user** or **Premium per capacity**, and when that capacity has the paginated reports workload enabled.*
