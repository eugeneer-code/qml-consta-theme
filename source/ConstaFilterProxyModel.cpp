#include "ConstaFilterProxyModel.h"

using namespace consta;

ConstaFilterProxyModel::ConstaFilterProxyModel(QObject *parent)
    : QSortFilterProxyModel(parent)
{
    setDynamicSortFilter(true);
}

QString ConstaFilterProxyModel::filter() const
{
    return _filter;
}

void ConstaFilterProxyModel::setFilter(const QString& filter)
{
    if(_filter == filter) return;
    _filter = filter;
    invalidateFilter();
    emit filterChanged();
}

QVariant ConstaFilterProxyModel::filterModel() const
{
    return QVariant::fromValue(sourceModel());
}

void ConstaFilterProxyModel::setFilterModel(const QVariant& model)
{
    auto itemModel = model.value<QAbstractItemModel*>();
    if(!itemModel) qDebug() << "Error converting QVariant to QAbstractItemModel*";
    else setSourceModel(itemModel);
    emit filterModelChanged();
}

QString ConstaFilterProxyModel::filterRole() const
{
    return _role;
}

void ConstaFilterProxyModel::setFilterRole(const QString& role)
{
    if(_role == role) return;
    _role = role;
    invalidateFilter();
    emit filterChanged();
}

bool ConstaFilterProxyModel::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{
    if(!sourceModel()) return true;
    if(_filter.isEmpty()) return true;
    const auto rawIndex = sourceModel()->index(sourceRow, 0, sourceParent);
    auto roleId = sourceModel()->roleNames().key(_role.toUtf8(), -1);
    if(roleId == -1) return true;
    const auto testString = sourceModel()->data(rawIndex, roleId).toString();
    return testString.contains(_filter, Qt::CaseInsensitive);
}