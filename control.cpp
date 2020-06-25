#include "control.h"
#include <QVector>
#include <ctime>
#include <fstream>
#include <iostream>

using namespace std;

QVector<int> addnewitem(QVector<int> map);
Control::Control(QObject *parent) : QObject(parent)
{

}

QVector<int> Control::newGame() {
    // Создаем пустое поле и добавляем два случайных числа в случайные позиции
    QVector<int> map;
    int poz1 = (rand() + time(0)) % 16;
    int poz2 = (rand() + time(0)) % 16;
    while(poz1 == poz2) {
        poz2 = (rand() + time(0)) % 16;
    }
    int value1, value2;
    value1 = (rand() + time(0)) % 10;
    value2 = (rand() + time(0)) % 10;
    if (value1 == 0) value1 = 4;
    else value1 = 2;
    if (value2 == 0) value2 = 4;
    else value2 = 2;
    for (int i = 0; i < 17; i++) {
        map.push_back(0);
    }
    map[poz1] = value1;
    map[poz2] = value2;
    return map;
}

QVector<int> Control::left(QVector<int> gameconfig) {
    QVector<int> map;
    map = gameconfig;
    bool index = false;
    bool changes[16];
    for (int i = 0; i < 17; i++) {
        changes[i] = 0;
    }
    for (int i = 0; i < 4; i++) {
        for (int n = 1; n < 4; n++) {
            if (map[n + i * 4] != 0) {
                int k = 0;
                while (k < n) {
                        if (map[k + i * 4] == 0) {
                            if (k == 0) {
                                map[k + i * 4] = map[n + i * 4];
                                map[n + i * 4] = 0;
                                index = true;
                            } else if (map[k - 1 + i * 4] == map[n + i * 4] && changes[k - 1 + i * 4] == 0) {
                                map[k - 1 + i * 4] *= 2;
                                map[n + i * 4] = 0;
                                map[16] += map[k - 1 + i * 4];
                                changes[k - 1 + i * 4] = 1;
                                index = true;
                            } else {
                                map[k + i * 4] = map[n + i * 4];
                                map[n + i * 4] = 0;
                                index = true;
                            }

                        } else if (k + 1 == n && map[n + i * 4] == map[n - 1 + i * 4] && changes[n - 1 + i * 4] == 0) {
                            map[n - 1 + i * 4] *= 2;
                            map[n + i * 4] = 0;
                            map[16] += map[n - 1 + i * 4];
                            changes[k + i * 4] = 1;
                            index = true;
                        }
                    k++;
                }
            }
        }
    }
    if (index == true) return addnewitem(map);
    else return map;
}

QVector<int> Control::right(QVector<int> gameconfig) {
    QVector<int> map;
    map = gameconfig;
    bool index = false;
    bool changes[16];
    for (int i = 0; i < 17; i++) {
        changes[i] = 0;
    }
    for (int i = 0; i < 4; i++) {
        for (int n = 2; n >= 0; n--) {
            if (map[n + i * 4] != 0) {
                int k = 3;
                while (k > n) {
                    if (map[k + i * 4] == 0) {
                        if (k == 3) {
                            map[k + i * 4] = map[n + i * 4];
                            map[n + i * 4] = 0;
                            index = true;
                        } else if (map[k + 1 + i * 4] == map[n + i * 4] && changes[k + 1 + i * 4] == 0) {
                            map[k + 1 + i * 4] *= 2;
                            map[n + i * 4] = 0;
                            map[16] += map[k + 1 + i * 4];
                            changes[k + 1 + i * 4] = 1;
                            index = true;
                        } else {
                            map[k + i * 4] = map[n + i * 4];
                            map[n + i * 4] = 0;
                            index = true;
                        }

                    } else if (k - 1 == n && map[n + i * 4] == map[n + 1 + i * 4] && changes[n + 1 + i * 4] == 0) {
                        map[n + 1 + i * 4] *= 2;
                        map[n + i * 4] = 0;
                        map[16] += map[n + 1 + i * 4];
                        changes[k + i * 4] = 1;
                        index = true;
                    }
                    k--;
                }
            }
        }
    }
    if (index == true) return addnewitem(map);
    else return map;
}

QVector<int> Control::up(QVector<int> gameconfig) {
    QVector<int> map;
    map = gameconfig;
    bool index = false;
    bool changes[16];
    for (int i = 0; i < 16; i++) {
        changes[i] = 0;
    }
    for (int n = 0; n < 4; n++) {
        for (int i = 1; i < 4; i++) {
            if (map[n + i * 4] != 0) {
                int k = 0;
                while (k < i) {
                    if (map[n + k * 4] == 0) {
                        if (k == 0) {
                            map[n + k * 4] = map[n + i * 4];
                            map[n + i * 4] = 0;
                            index = true;
                        } else if (map[n + (k - 1) * 4] == map[n + i * 4] && changes[n + (k - 1) * 4] == 0) {
                            map[n + (k - 1) * 4] *= 2;
                            map[n + i * 4] = 0;
                            map[16] += map[n + (k - 1) * 4];
                            changes[n + (k - 1) * 4] = 1;
                            index = true;
                        } else {
                            map[n + k * 4] = map[n + i * 4];
                            map[n + i * 4] = 0;
                            index = true;
                        }
                    } else if (k + 1 == i && map[n + k * 4] == map[n + i * 4] && changes[n + k * 4] == 0) {
                        map[n + k * 4] *= 2;
                        map[n + i * 4] = 0;
                        map[16] += map[n + k * 4];
                        changes[n + k * 4] = 1;
                        index = true;
                    }
                    k++;
                }
            }
        }
    }
    if (index == true) return addnewitem(map);
    else return map;
}

QVector<int> Control::down(QVector<int> gameconfig) {
    QVector<int> map;
    map = gameconfig;
    bool index = false;
    bool changes[16];
    for (int i = 0; i < 16; i++) {
        changes[i] = 0;
    }
    for (int n = 0; n < 4; n++) {
        for (int i = 2; i >= 0; i--) {
            if (map[n + i * 4] != 0) {
                int k = 3;
                while (k > i) {
                    if (map[n + k * 4] == 0) {
                        if (k == 3) {
                            map[n + k * 4] = map[n + i * 4];
                            map[n + i * 4] = 0;
                            index = true;
                        } else if (map[n + (k + 1) * 4] == map[n + i * 4] && changes[n + (k + 1) * 4] == 0) {
                            map[n + (k + 1) * 4] *= 2;
                            map[n + i * 4] = 0;
                            map[16] += map[n + (k + 1) * 4];
                            changes[n + (k + 1) * 4] = 1;
                            index = true;
                        } else {
                            map[n + k * 4] = map[n + i * 4];
                            map[n + i * 4] = 0;
                            index = true;
                        }
                    } else if (k - 1 == i && map[n + k * 4] == map[n + i * 4] && changes[n + k * 4] == 0) {
                        map[n + k * 4] *= 2;
                        map[n + i * 4] = 0;
                        map[16] += map[n + k * 4];
                        changes[n + k * 4] = 1;
                        index = true;
                    }
                    k--;
                }
            }
        }
    }
    if (index == true) return addnewitem(map);
    else return map;
}

QVector<int> addnewitem(QVector<int> map) {
    QVector<int> nullitems;
    for (int i = 0; i < 16; i++) {
        if (map[i] == 0) nullitems.push_back(i);
    }
    int value = (rand() + time(0)) % 10;
    if (value == 0) value = 4;
    else value = 2;
    map[nullitems[(rand() + time(0)) % nullitems.length()]] = value;
    return map;
}

bool Control::checkmove(QVector<int> configs) {
    bool index = false;
    for (int i = 0; i < 16; i++) {
        if (configs[i] == 0) index = true;
    }
    for (int i = 0; i < 4; i++) {
        for (int n = 0; n < 4; n++) {
            if (n > 0 && configs[n - 1 + i * 4] == configs[n + i * 4]) index = true;
            if (n < 3 && configs[n + 1 + i * 4] == configs[n + i * 4]) index = true;
            if (i > 0 && configs[n + (i - 1) * 4] == configs[n + i * 4]) index = true;
            if (i < 3 && configs[n + (i + 1) * 4] == configs[n + i * 4]) index = true;
        }
    }
    return index;
}

int Control::recordreading() {
    int a;
    ifstream fin("record.txt");
    if (fin.is_open()) {
        fin >> a;
        return a;
    } else return 0;
}

void Control::recordwriting(int record) {
    ofstream fout("record.txt");
    fout << record;
}
