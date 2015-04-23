# Today

#### **Get daily recommended Calories burned**


POST /api/user/getdailycalories

SEND

```
no parameters```
<br/>
RECV SUCCESS

```
{
    result:0,
    data:<(float) recommended Calories>
}```
---
<br/>
#### **Get daily recommended wonderpoints burned**


POST /api/user/getdailypoints

SEND

```
no parameters```
<br/>
RECV SUCCESS

```
{
    result:0,
    data:<(float) recommended Wonderpoints>
}```
---
<br/>
#### **Get today screen data**


POST /api/user/getdailysummary

SEND

```
{
    startTime:<(int) unix timestamp start time>,
    endTime:<(int) unix timestamp end time>
}```
<br/>
RECV SUCCESS

```
{
    result:0,
    data:{
        total:<(float) total wonder points earned>,
        suggested:<(float) suggested wonder points goal>,
        details:{
            pedometer:<(float) points earned from pedometer>,
            bike:<(float) points earned from biking>,
            stepper:<(float) points earned from stepper>
        }
    }
}```
<br/>
RECV FAIL

```
-4 = time range not set```
---
<br/>
#### **Get today screen data**


POST /api/user/getdailyoverview

SEND

```
{
    startTime:<(int) unix timestamp start time>,
    endTime:<(int) unix timestamp end time>
}```
<br/>
RECV SUCCESS

```
{
    result:0,
    data:{
        pedometer: {
            points:<(float) wonderpoints earned>,
            steps: <(int) step count>,
            distance: <(float) kilometers walked>,
            calories: <(float) calories burned>,
            time:<(float) walking time in seconds>
        },
        bike: {
            points:<(float) wonderpoints earned>,
            distance: <(float) kilometers biked>,
            calories: <(float) calories burned>,
            time: <(float) biking time in seconds>,
            maxSpeed: <(float) max speed in kilometers per hour>,
            averageSpeed:<(float) average speed in kilometers per hour>
        },
        stepper: {
            points:<(float) wonderpoints earned>,
            steps: <(int) steps walked>,
            distance: <(float) distance walked in kilometers>,
            calories: <(float) calories burned>,
            time: <(float) walking time in seconds>
        }
    }
}```
<br/>
RECV FAIL

```
-4 = time range not set```

---
#### Get Users List


POST /api/user/find

SEND

```
{
    limit:<(int) page size>,
    skip:<(int) page * page size>
}```

RECV

```
{
    result:0,
    data:<(User[]) list of users>,
    count:<(int) total count>
}```
---
#### Get wondercore platform friends


POST /api/user/getfriends

SEND

```
no parameters```
---
#### Get facebook friends on wondercore


POST /api/user/getfacebookfriends

SEND

```
no parameters```
---
```
Add friend (friend request)```


POST /api/user/addfriend

SEND

```
{
    users:<(String[]) array of user ids>
}```

RECV SUCCESS

```
{
    result:0,
    message:''
}```
---
#### Accept friend (accept friend request)


POST /api/user/acceptfriend

SEND

```
{
    user:<(String) id of user to befriend>
}```

RECV SUCCESS

```
{
    result:0,
    message:<(User) the resulting user object with list of friends>
}```

RECV FAIL

```
-4 = user not specified
-5 = this user did not send you a friend request```

