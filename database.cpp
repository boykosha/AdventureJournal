#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{
}

DataBase::~DataBase()
{
}

void DataBase::connectToDataBase()
{
    if(!QFile(DATABASE_NAME).exists())
    {
        this->restoreDataBase();
    }
    else
    {
        this->openDataBase();
    }
}


bool DataBase::restoreDataBase()
{
    if(this->openDataBase()){
        return (this->createTable()) ? true : false;
    }
    else
    {
        qDebug() << "Не удалось восстановить базу данных";
        return false;
    }
    return false;
}

bool DataBase::openDataBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName(DATABASE_NAME);
    if(db.open())
    {
        return true;
    }
    else
    {
        return false;
    }
}

void DataBase::closeDataBase()
{
    db.close();
}


bool DataBase::createTable()
{

    QSqlQuery query;
    if(!query.exec( "CREATE TABLE " TABLE " ("
                            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                            TABLE_ITEM      " VARCHAR(255)    NOT NULL,"
                            TABLE_PRICE     " VARCHAR(255)    NOT NULL,"
                            TABLE_HCURRENCY " VARCHAR(255)    NOT NULL"
                             " ) "
                    ))
    {
        qDebug() << "DataBase: error of create " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    }
    else
    {
        return true;
    }
    return false;
}

bool DataBase::insertIntoTable(const QVariantList &data)
{

    QSqlQuery query;
    query.prepare("INSERT INTO " TABLE " ( " TABLE_ITEM ", "
                                             TABLE_PRICE ", "
                                             TABLE_HCURRENCY " ) "
                  "VALUES (:Item, :Price, :Currency)");
    query.bindValue(":Item",        data[0].toString());
    query.bindValue(":Price",       data[1].toString());
    query.bindValue(":Currency",    data[2].toString());

    if(!query.exec())
    {
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    }
    else
    {
        return true;
    }
    return false;
}


bool DataBase::insertIntoTable(const QString &item, const QString &price, const QString &currency)
{
    QVariantList data;
    data.append(item);
    data.append(price);
    data.append(currency);

    if(insertIntoTable(data))
        return true;
    else
        return false;
}


bool DataBase::removeRecord(const int id)
{

    QSqlQuery query;
    query.prepare("DELETE FROM " TABLE " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    if(!query.exec())
    {
        qDebug() << "error delete row " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    }
    else
    {
        return true;
    }
    return false;
}

