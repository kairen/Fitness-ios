# Login
![](http://)

see the [Today](#Facebook Login and register).

#### **Facebook Login and register**


POST /api/user/auth

SEND


```
{
    username:<(string) username>,
    platformType:<(string) e.g. 'facebook'>,
    token:<(string) access token>,
    region:<(string) country name of user>
}```
<br/>
RECV SUCCESS

```
{
    result:0,
    message:<(User) user details>
}```
<br/>
RECV FAILURE

```
-3 = invalid username
-4 = user does not exist, please set username
```





---

<br/>
#### **Logout**


POST /api/user/logout

SEND

```
no parameters```

RECV SUCCESS

```
{
    result:1
    message:''
}```

---
<br/>
#### **Register**


POST /api/user

SEND

```
{
    email:<(string) user email>,
    username:<(string) username>,
    password:<(string) user password>,
    region:<(string) country name of user>
}```
<br/>
RECV SUCCESS

```
{
    result:0,
    data:<(User) user details>
}```

<br/>RECV FAIL


```
-3 = email or password is empty
-4 = password must be > 4 <= 16
-5 = user email already registered```

---
<br/>
#### **Login**



POST /api/user/login

SEND

```
{
    username:<(string) username>,
    password:<(string) user password>
}```
<br/>
RECV SUCCESS

```
{
    result:0,
    data:<(User) user details>
}```
<br/>
RECV FAIL

```
-3 = email or password is empty
-4 = incorrect email or password```
---
<br/>


