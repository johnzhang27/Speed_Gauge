#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>
int data[5] = {0,100,200,80,250};
class tempData: public QObject
{
public:
    int first();
    int second();
};

int tempData::first(){
    return 200;
}
int tempData::second(){
    return 100;
}
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<tempData>("com.mycompany.tempdata", 1, 0, "FakeData");
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
