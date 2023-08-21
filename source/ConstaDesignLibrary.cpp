#include "ConstaDesignLibrary.h"
#include <QtQml/QtQml>

void ConstaDesignLibrary::initLibrary(QQmlEngine *engine)
{
    // Init resources from static lib
	Q_INIT_RESOURCE(ConstaDesignRes);

    // Define module search path
    engine->addImportPath(":/");

    qDebug() << "Consta library init done";
}