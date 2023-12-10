#ifndef DENT_DIARY_PATIENTSPROXYMODEL_H
#define DENT_DIARY_PATIENTSPROXYMODEL_H
#include <QSortFilterProxyModel>

namespace consta {

class ConstaFilterProxyModel : public QSortFilterProxyModel {
    Q_OBJECT
    Q_PROPERTY(QString filter READ filter WRITE setFilter NOTIFY filterChanged)
    Q_PROPERTY(QString filterRole READ filterRole WRITE setFilterRole NOTIFY filterRoleChanged)
signals:
    void filterChanged();
    void filterRoleChanged();

public:
    ConstaFilterProxyModel(QObject *parent);
    QString filter() const;
    void setFilter(const QString &filter);
    QString filterRole() const;
    void setFilterRole(const QString& role);

protected:
    bool filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const override;
    //bool lessThan(const QModelIndex &left, const QModelIndex &right) const override;

private:
    QString _filter;
    QString _role;
};

}

#endif
