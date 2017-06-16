#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>

#define DATABASE_HOSTNAME   "UserDataBase"
#define DATABASE_NAME       "Check.db"

#define TABLE                  "CheckTable"
#define TABLE_ITEM             "Item"
#define TABLE_PRICE            "Price"
#define TABLE_HCURRENCY        "Currency"

class DataBase: public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    void connectToDataBase();
private:
    QSqlDatabase    db;

private:
    bool openDataBase();
    bool restoreDataBase();
    void closeDataBase();
    bool createTable();

public slots:
    bool insertIntoTable(const QVariantList &data);
    bool insertIntoTable(const QString &item, const QString &price, const QString &currency);
    bool removeRecord(const int id);
};

#endif // DATABASE_H
