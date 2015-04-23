# Challenge
#### Challenge


Model Fields

```
{
    id:<(string) id of challenge>,
    title:<(string) user defined title>,
    description:<(string) user defined description>,
    isActive:<(bool) whether the challenge is active>,
    goal:<(float) the value of the goal>,
    goalType:<(string) the units for the goal value, values are:['points', 'distance', 'time']. currently only 'points' is used>,
    activityType:<(string) the activity type restriction. values are:['steps', 'bike']>,
    dataSource:<(string) optional field for the dataSource restriction values are:['pedometer', 'stepper', 'bike']>,
    region:<(string) region where the challenge was created. this is optional, and if set, should be the country code where the user is in>,
    weekDays:<(array) array of boolean values of which days of the week the challenge is active for. This is for the user personal challenge, and the week starts on monday>,
    timeLimit:<(int) this is an optional field which restricts the user to meet the goal within this time limit. The units are 'seconds'>,
    startTime:<(int) unix timestamp of start time>,
    endTime:<(int) unix timestamp of end time>,
    reward:<(json) optional, the reward of the challenge>,
    user:<(User) challenge creator user object>,
    participants:<(User[]) user that have joined the challenge>,
    invitations:<(User[]) users that have been invited to the challenge. If there are no invited users, this challenge is public. If the only invited user is the creator, the challenge is a personal challenge>,
    invitedGroups:<(Group[]) groups that have been invited to the challenge>,
    joinedGroups:<(Group[]) groups that have already joined the challenge>
}```
---
#### Create Challenge

POST /api/challenge

SEND


```
{
    title:<(string) user defined title>,
    description:<(description) user defined description>,
    goal:<(float) the value of the goal>,
    goalType:<(string) the units for the goal value, values are:['points', 'distance', 'time']. currently only 'points' is used>,
    activityType:<(string) the activity type restriction. values are:['steps', 'bike']>,
    dataSource:<(string) optional field for the dataSource restriction values are:['pedometer', 'stepper', 'bike']>,
    region:<(string) region where the challenge was created. this is optional, and if set, should be the country code where the user is in>,
    weekDays:<(array) array of boolean values of which days of the week the challenge is active for. This is for the user personal challenge, and the week starts on monday>,
    timeLimit:<(int) this is an optional field which restricts the user to meet the goal within this time limit. The units are 'seconds'>,
    startTime:<(int) unix timestamp of start time>,
    endTime:<(int) unix timestamp of end time>,
    invitations:<(User[]) id of users that have been invited to the challenge. If there are no invited users, this challenge is public. If the only invited user is the creator, the challenge is a personal challenge>,
    invitedGroups:<(Group[]) id of groups that have been invited to the challenge>
}```


RECV SUCCESS

```
{
    result:0,
    message:<(Challenge) the challenge object that was created>
}```

RECV FAIL

```
-4 = endTime is not after startTime
-5 = endTime is in the past
-6 = goal value must be greater than 0
-7 = participants not set```
---
#### Join/leave multiplayer challenge


PUT /api/challenge/:id

SEND

```
{
    participants:<(string[]) new list of ids of users participating>
}```

---
#### Join/leave team challenge


PUT /api/challenge/:id

SEND

```
{
    joinedGroups:<(string[]) new list of ids of groups participanting>
}```
---
#### Get list of invited challenges


POST /api/challenge/find

SEND

```
{
    invitations:<(string) your user id>,
    participants:{
        '!':<(string) your user id>
    }
    endTime:{
        '>=':<(int) unix timestamp current time>
    },
    limit:<(int) page size>,
    skip:<(int) page * page size>
}```
---
#### Get list of joined ongoing challenges

POST /api/challenge/find

SEND

```
{
    participants:<(string) your user id>,
    endTime:{
        '>=':<(int) unix timestamp current time>
    },
    limit:<(int) page size>,
    skip:<(int) page * page size>
}```
---
#### Get challenge difficulty suggestions

POST /api/challenge/getsuggested

SEND

```
no parameters```

RECV SUCCESS

```
{
    result:0,
    data:{
        rates:{//these are wonderpoints/minute
            'bike':<(float) suggested points per minute>,
            'pedometer':<(float) suggested points per minute>,
            'stepper':<(float) suggested points per minute>,
        },
        difficulties:[//these are multipliers for the wonder point rates
            1, 1.25, 1.5, 1.75, 2
        ]
    }
}```


---
