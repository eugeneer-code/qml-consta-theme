#include "ConstaDesignLibrary.h"
#include <QtQml/QtQml>
#include <QQmlApplicationEngine>
#include "Utils.h"
#include "ConstaStyle.h"

using namespace consta;

void ConstaDesignLibrary::initLibrary(QQmlEngine *engine)
{
    qmlRegisterUncreatableType<consta::ConstaStyle>("Consta", 1, 0, "ConstaStyle", "Consta attached properties");


    // Init resources from static lib
	Q_INIT_RESOURCE(ConstaDesignRes);


    // Define module search path
    engine->addImportPath(":/");

    static Utils utils;
    engine->rootContext()->setContextProperty("_ConstaUtils", &utils);

    qDebug() << "Consta library init done";
}