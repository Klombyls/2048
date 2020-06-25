#ifndef CONTROL_H
#define CONTROL_H

#include <QObject>
#include <QVector>

class Control : public QObject
{
    Q_OBJECT
public:
    explicit Control(QObject *parent = nullptr);

signals:

public slots:
    QVector<int> newGame();
    QVector<int> left(QVector<int> gameconfig);
    QVector<int> right(QVector<int> gameconfig);
    QVector<int> up(QVector<int> gameconfig);
    QVector<int> down(QVector<int> gameconfig);
    bool checkmove(QVector<int> configs);
    int recordreading();
    void recordwriting(int record);

};

#endif // CONTROL_H
