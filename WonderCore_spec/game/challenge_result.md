# Challenge Result
####Challenge Result

Model Fields

```
{
    id:<(string) id of object>,
    user:<(User) user that the result belongs to>,
    group:<(Group) the group that the result belongs to>,
    challenge:<(Challenge) Challenge that the result is for>,
    challengeDate:<(int) unix timestamp of start of day in client local timezone>,
    sessions:<(array) list of associated sessions>,
    value:<(float) score of the result in wonder points>
}```
---
#### Get challenge rankings


POST /api/challengeresult/find

SEND

```
{
    challenge:<(string) id of challenge>,
    sort:'value DESC',
    limit:<(int) page size>,
    skip:<(int) page * page size>
}```

RECV SUCCESS

```
{
    result:0
    data:<(ChallengeResult[]) list of ChallengeResult objects>,
    count:<(int) total count>
}```
---
#### Get personal challenge results


POST /api/challengeresult/find

SEND

```
{
    challenge:<(string) id of challenge>,
    sort:'challengeDate DESC',
    challengeDate:{
        '>=':<(int) unix timestamp of start date>,
        '<=':<(int) unix timestamp of end date>,
    },
    limit:<(int) page size>,
    skip:<(int) page * page size>
}```

RECV SUCCESS

```
{
    result:0
    data:<(ChallengeResult[]) list of ChallengeResult objects>,
    count:<(int) total count>
}```

---
##Team

Model Fields

```
{
    id:<(string) team id>,
    title: <(string) title of team>,
    description: <(string) team description>,
    creator: <(User) creator of team>,
    invitations:<(User[]) array of users invited to the team>,
    members: <(User[]) array of users in this team>,
}```
---
#### Get list of invited teams

POST /api/team/find

```
{
    invitations:<(string) your user id>,
    members:{
        'not':<(string) your user id>
    }
}```
---
#### Create a team

POST /api/team

SEND

```
{
    title:<(string) title of team>,
    description:<(string) description>,
    creator:<(string) id of creator>,
    invitations:<(string[]) array of invited users>
}```
---

#### Accept a team invitation

PUT /api/team/:id

SEND

```
{
    members:<(string[]) new list of invited user ids>
}```


##User friend
#### **Get Users List**


POST /api/user/find

SEND

```
{
    limit:<(int) page size>,
    skip:<(int) page * page size>
}```
<br>
RECV

```
{
    result:0,
    data:<(User[]) list of users>,
    count:<(int) total count>
}```
---
<br/>
#### **Get wondercore platform friends**


POST /api/user/getfriends

SEND

```
no parameters```
---
<br>
#### **Get facebook friends on wondercore**


POST /api/user/getfacebookfriends

SEND

```
no parameters```
---
<br/>
#### **Add friend (friend request)**


POST /api/user/addfriend

SEND

```
{
    users:<(String[]) array of user ids>
}```
<br>
RECV SUCCESS

```
{
    result:0,
    message:''
}```
---
<br/>
#### **Accept friend (accept friend request)**


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

<br/>
RECV FAIL

```
-4 = user not specified
-5 = this user did not send you a friend request```
