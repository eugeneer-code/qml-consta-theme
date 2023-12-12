#ifndef DENT_DIARY_PATIENTSPROXYMODEL_H
#define DENT_DIARY_PATIENTSPROXYMODEL_H
#include <QSortFilterProxyModel>

namespace consta {

class ConstaFilterProxyModel : public QSortFilterProxyModel {
    Q_OBJECT
    Q_PROPERTY(QString filter READ filter WRITE setFilter NOTIFY filterChanged)
    Q_PROPERTY(QString filterRole READ filterRole WRITE setFilterRole NOTIFY filterRoleChanged)
    Q_PROPERTY(QVariant filterModel READ filterModel WRITE setFilterModel NOTIFY filterModelChanged)
signals:
    void filterChanged();
    void filterRoleChanged();
    void filterModelChanged();

public:
    ConstaFilterProxyModel(QObject *parent = nullptr);
    QString filter() const;
    void setFilter(const QString &filter);
    QString filterRole() const;
    void setFilterRole(const QString& role);
    QVariant filterModel() const;
    void setFilterModel(const QVariant& model);

    Q_INVOKABLE int sourceIndex(int row) const;

protected:
    bool filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const override;
    //bool lessThan(const QModelIndex &left, const QModelIndex &right) const override;

private:
    QString _filter;
    QString _role;
};

}

#endif
