import QtQuick 2.6
import QtQuick.Window 2.2

Item{
    id: mainpage
    width: 800; height: 480

    DB_API{ id: dbapi }

    Text{
        text: dbapi.create_tables()
    }
}
