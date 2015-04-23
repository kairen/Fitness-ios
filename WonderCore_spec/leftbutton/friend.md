# Friend
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
