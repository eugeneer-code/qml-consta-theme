#include "ConstaDesignLibrary.h"
#include <QtQml/QtQml>
#include <QQmlApplicationEngine>
#include "Utils.h"
#include "ConstaStyle.h"
#include "RoundedRect/RoundedRectangle.h"

void ConstaDesignLibrary::initLibrary(QQmlEngine *engine)
{
    // Register C++ classes
    qmlRegisterUncreatableType<consta::ConstaStyle>("Consta", 1, 0, "ConstaStyle", "Consta attached properties");
    qmlRegisterType<RoundedRectangle>("Consta", 1, 0, "RoundedRectangle");

    // Init resources from static lib
	Q_INIT_RESOURCE(ConstaDesignRes);

    // Define module search path
    engine->addImportPath(":/");

    static consta::Utils utils;
    engine->rootContext()->setContextProperty("_ConstaUtils", &utils);

    qDebug() << "Consta library init done";
}