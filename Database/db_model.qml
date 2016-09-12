import QtQuick 2.6
import QtQuick.Window 2.2

Item{
    id: mainpage
    width: 800; height: 480

    DB_Comm{ id: db_comm }

    Text{
        text: db_comm.create_tables()
    }
}
