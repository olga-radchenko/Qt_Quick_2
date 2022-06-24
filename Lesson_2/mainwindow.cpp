#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_dateFormBttn_clicked()
{
    if(dating_profile == nullptr)
        dating_profile = new QQmlApplicationEngine(this);

    dating_profile->load(QUrl(QStringLiteral("qrc:/dating_profile.qml")));
}

void MainWindow::on_squareBttn_clicked()
{
    if(square_to_circle == nullptr)
        square_to_circle = new QQmlApplicationEngine(this);

    square_to_circle->load(QUrl(QStringLiteral("qrc:/square_to_circle.qml")));
}
