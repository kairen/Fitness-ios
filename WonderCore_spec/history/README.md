# History
## ExerciseSession

Model Fields

```
{
    id:<(string) id of the session>,
    activityType:<(string) type of activity>,
    sessionType:<(string) 'session' if not associated with any challenges, 'challenge' if it is for a challenge>,
    startTime:<(int) unix timestamp>,
    endTime:<(int) unix timestamp>,
    user:<(User) json object of the user>,
    datas:<(ExerciseSessionData[]) list of exercise session data for this session>,
    calories:<(float) calories burned calculated from the server>,
    points:<(float) wonderpoints gained for this session>
}```
---
#### Session create

POST /api/exercisesession

SEND

```
{
    activityType:<(string) type of activity>,
    sessionType:<(string) 'challenge' or 'session'>,
    startTime:<(int) optional unix timestamp>,
    endTime:<(int) optional unix timestamp>,
    sessionDate:<(int) unix timestamp of when the day starts for the user in their timezone e.g. 1427644800 is 2015/03/30 00:00:00 in GMT+08:00>
}```

RECV SUCCESS

```
{
    result:0,
    data:<(json) the object that was created>
}```
---
#### Update session with exercise data

POST /api/exercisesessiondata

SEND

```
{
    session:<(string) id of the session>,
    dataSource:<(string) 'pedometer', 'stepper', 'bike'>,
    data:<(json[]) the array of data from the source>
}```

Format of data is:
```
{
    startTime:<(int) unix timestamp>,
    endTime:<(int) unix timestamp>,
    units:<(string) e.g. speed/cadence/steps (all units are in metric when applicable)>,
    value:<(float) actual value of this data field>,
    altValue:<(string) this will be all other values that are not representable as a float>
}```

RECV SUCCESS

```
{
    result:0,
    message:<(ExerciseSessionData) the object that was created>
}```
---
#### Query exercise sessions

POST /api/exercisesession/find

SEND

```
{
    startTime:{
        '>=':<(int) start time filter>,
    },
    endTime:{
        '<=':<(int) end time filter>
    },
    sessionType:<(string) optional session type>,

}```

RECV SUCCESS

```
{
    result:0
    data:<(string[]) array of ids of ExerciseSession objects>,
    count:<(int) total count>
}```



---
## ExerciseSessionData


Model Fields

```
{
    id:<(string) id of session data>,
    session:<(string) id of the session>,
    dataSource:<(string) name of the datasource>,
    data:<(array) array of data from device>
}```

dataSource types are:
* pedometer
* stepper
* bike
* gps


Format for data

```
{
    startTime:<(int) unix timestamp>,
    endTime:<(int) unix timestamp>,
    units:<(string) e.g. speed/cadence/steps (all units are in metric when applicable)>,
    value:<(float) actual value of this data field>,
    altValue:<(json) this will be all other values that are not representable as a float>
}```

---
#### Create ExerciseSessionData

POST /api/exercisesessiondata

SEND

```
{
    session:<(string) id of the session>,
    dataSource:<(string) name of the datasource>,
    data:<(array) array of data from device>
}```

RECV Fail

```
-4 = session not found```

