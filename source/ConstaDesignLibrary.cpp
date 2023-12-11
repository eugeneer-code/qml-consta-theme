#include "ConstaDesignLibrary.h"
#include <QtQml/QtQml>
#include <QQmlApplicationEngine>
#include "Utils.h"
#include "ConstaStyle.h"
#include "RoundedFrame.h"
#include "ConstaFilterProxyModel.h"

void ConstaDesignLibrary::initLibrary(QQmlEngine *engine)
{
    // Register C++ classes
    consta::ConstaFilterProxyModel model;
    qmlRegisterUncreatableType<consta::ConstaStyle>("Consta", 1, 0, "ConstaStyle", "Consta attached properties");
    qmlRegisterType<consta::ConstaFilterProxyModel>("Consta", 1, 0, "ConstaFilterProxyModel");
    qmlRegisterType<RoundedFrame>("Consta", 1, 0, "RoundedFrame");

    // Init resources from static lib
	Q_INIT_RESOURCE(ConstaDesignRes);

    // Define module search path
    engine->addImportPath(":/");

    static consta::Utils utils;
    engine->rootContext()->setContextProperty("_ConstaUtils", &utils);

    qDebug() << "Consta library init done";
}