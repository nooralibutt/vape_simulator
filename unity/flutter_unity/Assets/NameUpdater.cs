using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using FlutterUnityIntegration;
using UnityEngine.UI;

public class NameUpdater : MonoBehaviour, IEventSystemHandler
{

    void Start()
    {
        GetComponent<Text>().text = "Zaihd Khan";
    }

    private void OnEnable()
    {
        UnityMessageManager.Instance.SendMessageToFlutter("OnEnable called");

        UnityMessageManager.Instance.OnFlutterMessage += Instance_OnFlutterMessage;
    }
    
    private void OnDisable()
    {
        UnityMessageManager.Instance.SendMessageToFlutter("OnDisable called");

        UnityMessageManager.Instance.OnFlutterMessage -= Instance_OnFlutterMessage;
    }

    private void Instance_OnFlutterMessage(MessageHandler handler)
    {
        UnityMessageManager.Instance.SendMessageToFlutter(string.Format("id: {0} name:{1} seq: {2}", handler.id, handler.name, handler.seq));

        Invoke("updatedFromOnFlutterMessaage", 10);
    }

    void updatedFromOnFlutterMessaage() {
        UnityMessageManager.Instance.SendMessageToFlutter("updatedFromOnFlutterMessaage called");

        UpdateName("Instance_OnFlutterMessage Noor Ali");
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    // This method is called from Flutter
    public void UpdateName(String message)
    {
        UnityMessageManager.Instance.SendMessageToFlutter("UpdateName called");

        GetComponent<Text>().text = message;
    }
}
