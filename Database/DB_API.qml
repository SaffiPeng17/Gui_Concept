import QtQuick 2.0

Item{
    id: database_api

/***********************************************************/
/*          Data Model: Database define                    */
/***********************************************************/
    property variant employee_schema: ["e_ID", "e_name", "e_department", "e_title", "e_seniority"]
    property variant department_schema: ["d_ID", "d_name", "d_position"]

    property variant schema_list: [employee_schema, department_schema]
    property variant table_list: ["EmployeeTable", "DepartmentTable"]

/***********************************************************/
/*          Private Functions                              */
/***********************************************************/
    function isArray(arr)
    {
        return Object.prototype.toString.apply(arr) === '[object Array]';
    }
//-----------------------------------------------------------
    function isNumber(num)
    {
        return Object.prototype.toString.apply(num) === '[object Number]';
    }
//-----------------------------------------------------------
    function sql(query) //Catch error from SQLite & return
    {
        var res = 0;
        try{
            var db = openDatabaseSync("MyDB", "1.0", "My model SQL", 1000000)
            db.transaction( function(tx) { res = tx.executeSql(query); } );
            return res
        }
        catch(error){
            console.log("[SQL] cmd error: " +error);
        }
    }
//-----------------------------------------------------------
    function compose_items(compose_type, items, values)
    {
        var cmd = (compose_type == "where")? "WHERE " : "SET "
        var connect = (compose_type == "where")? " AND " : ", "
        var every_value = ""
        var result = "err" //for compose multiple conditions

        if(isArray(items))
        {
            if(items.length == values.length)
            {
                for(var i = 0; i < items.length; i++)
                {
                    every_value = isNumber(values[i])? values[i] : "'"+values[i]+"'"
                    if(i == 0)
                        result = cmd + items[i] +"="+ every_value
                    else
                        result += connect + items[i] +"="+ every_value
                }
            }
        }
        else
        {
            every_value = isNumber(values)? values : "'"+values+"'"
            result = cmd + items +"="+ every_value
        }

        return result
    }

/***********************************************************/
/*          Public Functions                               */
/***********************************************************/
    function create_tables()
    {
        sql("CREATE TABLE IF NOT EXISTS EmployeeTable(index_code INTEGER PRIMARY KEY AUTOINCREMENT,e_ID,e_name,e_department,e_title,e_seniority);")
        sql("CREATE TABLE IF NOT EXISTS DepartmentTable(index_code INTEGER NOT NULL,d_ID,d_name,d_position);");
    }
//-----------------------------------------------------------
    function getColumnsofTable(table)
    {
        return sql("PRAGMA TABLE_INFO('"+table+"');")
    }
//-----------------------------------------------------------
    function alterTable(alter_type, table, column, datatype)
    {
        if(alter_type == "") return "Without alter_type !"
        if(table == "") return "Without Table name !"
        if(column == "") return "Without alter Column !"
        return sql("ALTER TABLE '"+table+"' '"+alter_type+"' COLUMN '"+column+"' '"+datatype+"';")
    }
    function alterTable_add (table, column) { alterTable("ADD", table, column, "") }
    function alterTable_drop (table, column) { alterTable("DROP", table, column, "") }
    function alterTable_modi (table, column) { alterTable("MODIFY", table, column, "") }
    function alterTable_addtype (table, column, datatype) { alterTable("ADD", table, column, datatype) }
    function alterTable_moditype (table, column, datatype) { alterTable("MODIFY", table, column, datatype) }
//-----------------------------------------------------------
    function isLocalTableNewest()
    {
        var query_Cols = 0
        var local_ColSum = 0, define_ColSum = 0;

        for(var i = 0; i < table_list.length; i++)
        {
            query_Cols = getColumns(table_list[i])
            local_ColSum = query_Cols.rows.length
            define_ColSum = schema_list[i].length
            console.log("[SQL] "+table_list[i]+": Local sum = "+local_ColSum+", Define sum = " +define_ColSum)

            //if local_ColSum < define_ColSum, add lost columns into local Table by reference Define
            if(local_ColSum < define_ColSum)
            {
                for(var j = local_ColSum; j < define_ColSum; j++)
                {
                    addNewColumn(table_list[i], schema_list[i][j])
                    console.log("\t   col "+j+" ++: "+schema_list[i][j])
                }
                console.log("\t  Recover Columns is done. Current Local sum = "+getColumns(table_list[i]).rows.length)
            }
            else if(local_ColSum > define_ColSum)
            {
                console.log("[SQL] "+table_list[i]+" error: Local columns is more than Define !")
                return false
            }
        }
        return true
    }
//-----------------------------------------------------------
    function getRecords(search_type, table, select_items, condition, criteria, orderby, limit_index, limit_count)
    {
        if(table == "") return "Without Table name !"
        if(select_items == "") return "Without Select Items of records !"

        var columns = "", where_conds = "", orderby_conds = "", limit_conds = ""

        //--Judge variables
        columns = isArray(select_items)? select_items.toString() : select_items
        if(condition != "") {
            if(search_type == "date")
                where_conds = "WHERE "+ condition +"BETWEEN date("+ criteria[0] +"AND date("+ criteria[1]
            else
                where_conds = compose_items("where", condition, criteria)
        }
        orderby_conds = (orderby != "")? "ORDER BY "+orderby : ""
        limit_conds = (limit_count > 0)? "DESC LIMIT "+ limit_index +","+ limit_count : ""

        //--Compose to SQL query
        if(where_conds != "err")
            return sql("SELECT '"+columns+"' FROM '"+table+"' '"+where_conds+"' '"+orderby_conds+"' '"+limit_conds+"';")
        else
            return "The quantity of condition is not consistent with criteria !"
    }
    function getRecords_bsc (table, select_items) { getRecords("", table, select_items, "", "", "", "", "") }
    function getRecords_bscdate (table, select_items) { getRecords("date", table, select_items, "", "", "", "", "") }
    function getRecords_where (search_type, table, select_items, condition, criteria) { getRecords(search_type, table, select_items, condition, criteria, "", "", "") }
    function getRecords_orderby (search_type, table, select_items, orderby) { getRecords(search_type, table, select_items, "", "", orderby, "", "") }
    function getRecords_limit (search_type, table, select_items, limit_index, limit_count) { getRecords(search_type, table, select_items, "", "", "", limit_index, limit_count) }
    function getRecords_whorderby (search_type, table, select_items, condition, criteria, orderby) { getRecords(search_type, table, select_items, condition, criteria, orderby, "", "") }
    function getRecords_wherelimit (search_type, table, select_items, condition, criteria, limit_index, limit_count) { getRecords(search_type, table, select_items, condition, criteria, "", limit_index, limit_count) }
    function getRecords_orderbylimit (search_type, table, select_items, orderby, limit_index, limit_count) { getRecords(search_type, table, select_items, "", "", orderby, limit_index, limit_count) }
//-----------------------------------------------------------
    function getRecordCounts(search_type, table, count_items, condition, criteria)
    {
        if(table == "") return "Without Table name !"
        if(count_items == "") return "Without Count Items of records !"

        var where_conds = ""

        //--Judge variables
        if(condition != "") {
            if(search_type == "date")
                where_conds = "WHERE "+ condition +"BETWEEN date("+ criteria[0] +"AND date("+ criteria[1]
            else
                where_conds = compose_items("where", condition, criteria)
        }

        //--Compose to SQL query
        if(where_conds != "err")
            return sql("SELECT COUNT('"+count_items+"') FROM '"+table+"' '"+where_conds+"';")
        else
            return "The quantity of condition is not consistent with criteria !"
    }
    function getRecordCounts_bsc (table, count_items) { getRecordCounts("", table, count_items, "", "") }
    function getRecordCounts_bscdate (table, count_items) { getRecordCounts("date", table, count_items, "", "") }
//-----------------------------------------------------------
    function insertRecord(insert_type, table, insert_column, insert_value, from_column, from_table, from_condition, from_criteria)
    {
        if(table == "") return "Without Table name !"
        if(insert_value == "") return "Without Value(s) for insert !"

        var columns = "", values = "", specified_case = ""

        //--Judge variables
        values = isArray(insert_value)? insert_value.toString() : insert_value
        columns = (insert_column != "")? (isArray(insert_column)? "("+insert_column.toString()+")" : "("+insert_column+")") : ""
        if(insert_type == "unique")
        {
            var newCondition = compose_items("where", insert_column, insert_value)
            if(newCondition != "err")
                specified_case = "SELECT"+ values +" WHERE NOT EXISTS (SELECT * FROM "+ table +" "+ newCondition +")"
            else
                return "The quantity of condition is not consistent with criteria !"
        }
        else if(insert_type == "copy")
        {
            var fr_columns = isArray(from_column)? from_column.toString() : from_column
            var fr_condition = compose_items("where", from_condition, from_criteria)
            if(fr_condition != "err")
                specified_case = "SELECT"+ fr_columns +" FROM "+ from_table +" "+ fr_condition
            else
                return "The quantity of condition is not consistent with criteria !"
        }

        //--Compose to SQL query
        return sql("INSERT INTO '"+table+"' '"+columns+"' VALUES('"+values+"') '"+specified_case+"';")
    }
    function insertRecord_bsc (table, insert_value) { insertRecord("", table, "", insert_value, "", "", "", "") }
    function insertRecord_bscspec (table, insert_column, insert_value) { insertRecord("", table, insert_column, insert_value, "", "", "", "") }
    function insertRecord_bscuni (table, insert_column, insert_value) { insertRecord("unique", table, insert_column, insert_value, "", "", "", "") }
    function insertRecord_bscspec (table, insert_column, insert_value, from_column, from_table, from_condition, from_criteria) { insertRecord("copy", table, insert_column, insert_value, from_column, from_table, from_condition, from_criteria) }
//-----------------------------------------------------------
    function deleteRecord(table, condition, criteria)
    {
        if(table == "") return "Without Table name !"

        var where_conds = ""

        //--Judge variables
        where_conds = (condition != "")? compose_items("where", condition, criteria) : ""

        //--Compose to SQL query
        if(where_conds != "err")
            return sql("DELETE FROM '"+table+"' '"+where_conds+"';")
        else
            return "The quantity of condition is not consistent with criteria !"
    }
    function deleteRecord_all (table) { deleteRecord(table, "", "") }
//-----------------------------------------------------------
    function updateRecord(table, update_item, update_value, condition, criteria)
    {
        if(table == "") return "Without Table name !"
        if(update_item == "") return "Without Update Items !"
        if(update_value == "") return "Without Update Value(s) !"

        var sets = "", where_conds = ""

        //--Judge variables
        sets = compose_items("set", update_item, update_value)
        where_conds = (condition != "")? compose_items("where", condition, criteria) : ""

        //--Compose to SQL query
        if(where_conds != "err")
            return sql("UPDATE '"+table+"' '"+sets+"' '"+where_conds+"';")
        else
            return "The quantity of condition is not consistent with criteria !"
    }
    function updateRecord_bsc (table, update_item, update_value) { updateRecord(table, update_item, update_value, "", "") }
//-----------------------------------------------------------
    function getMaxValue(table, max_item, as_name)
    {
        if(table == "") return "Without Table name !"
        if(max_item == "") return "Without Max Items of search !"

        var as_item = (as_name != "")? "AS "+as_name : ""
        return sql("SELECT MAX('"+max_item+"') '"+as_item+"' FROM '"+table+"';")
    }
    function getMaxValue_bsc (table, max_item) { getMaxValue(table, max_item, "") }
//-----------------------------------------------------------
    function dropTable(table)
    {
        if(table == "") return "Without Table name !"
        return sql("DROP TABLE IF EXISTS '"+table+"';")
    }
}
