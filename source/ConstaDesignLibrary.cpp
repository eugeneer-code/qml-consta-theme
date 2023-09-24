#include "ConstaDesignLibrary.h"
#include <QtQml/QtQml>
#include "Utils.h"

void ConstaDesignLibrary::initLibrary(QQmlEngine *engine)
{
    // Init resources from static lib
	Q_INIT_RESOURCE(ConstaDesignRes);

    // Define module search path
    engine->addImportPath(":/");

    static Utils utils;
    engine->rootContext()->setContextProperty("_ConstaUtils", &utils);

    qDebug() << "Consta library init done";
}