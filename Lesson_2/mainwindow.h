#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QQmlComponent>
#include <QQmlApplicationEngine>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_dateFormBttn_clicked();
    void on_squareBttn_clicked();

private:
    Ui::MainWindow *ui;
    QQmlApplicationEngine *dating_profile{nullptr};
    QQmlApplicationEngine *square_to_circle{nullptr};
};
#endif // MAINWINDOW_H
