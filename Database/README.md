# Database functions for build up SQL command
*The purpose of project is showing out several functions define in DB_Comm.qml for communicate with Database by SQL commands. You can interactive with Database through by them and do not know SQL syntax.*
<br>

## The Functions
### create_tables()
*For create Tables into Databas.*<br>
#### 1. Define Table names & Schemas as Array. And follow the format like:<br>
#### Define Table names:
    property variant table_list: ["EmployeeTable", "DepartmentTable"]
#### Define Schemas:    
    property variant employee_schema: ["e_ID", "e_name", "e_department", "e_title", "e_seniority"]
    property variant department_schema: ["d_ID", "d_name", "d_position"]
#### Group Schemas:   
    property variant schema_list: [employee_schema, department_schema]

<br>
