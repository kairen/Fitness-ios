# Notification
Model Fields

```
{
    id: <(string) user id>,
    user:<(User) the user that the notification is for>,
    notificationType:<(string) notification type>,
    content:<(json string) custom json depending on the notificationType>
}```
---
Notification Types

```
{
    notificationType:'friendRequest',
    content:{
        from:<(String) id of user that sent the request>
    }
}```

