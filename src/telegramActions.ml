open TelegramApi.Command

(* Action combinators *)
(* TODO: These names suck, we need something more descriptive *)

let (@/>) c1 c2 = Chain (c1, c2)

let (@/<) c1 c2 = c1 ~and_then:c2

(* Normal actions *)

let nothing = Nothing

let get_me ~and_then = GetMe and_then

let send_message ~chat_id ?(disable_notifications=false) ?reply_to ?reply_markup =
  Printf.ksprintf
    (fun s ->
       SendMessage (chat_id, s, disable_notifications, reply_to, reply_markup))

let forward_message ~chat_id ~from_chat_id ?(disable_notifications=false) ~message_id =
  ForwardMessage (chat_id, from_chat_id, disable_notifications, message_id)

let send_chat_action ~chat_id action =
  SendChatAction (chat_id, action)

let send_photo ~chat_id ?caption ?(disable_notifications=false) ?reply_to ?reply_markup photo ~and_then =
  SendPhoto (chat_id, photo, caption, disable_notifications, reply_to, reply_markup, and_then)

let resend_photo ~chat_id ?caption ?(disable_notifications=false) ?reply_to ?reply_markup photo =
  ResendPhoto (chat_id, photo, caption, disable_notifications, reply_to, reply_markup)

let send_audio ~chat_id ~performer ~title ?(disable_notifications=false) ?reply_to ?reply_markup audio ~and_then =
  SendAudio (chat_id, audio, performer, title, disable_notifications, reply_to, reply_markup, and_then)

let resend_audio ~chat_id ~performer ~title ?(disable_notifications=false) ?reply_to ?reply_markup audio =
  ResendAudio (chat_id, audio, performer, title, disable_notifications, reply_to, reply_markup)

let send_document ~chat_id ?(disable_notifications=false) ?reply_to ?reply_markup document ~and_then =
  SendDocument (chat_id, document, disable_notifications, reply_to, reply_markup, and_then)

let resend_document ~chat_id ?(disable_notifications=false) ?reply_to ?reply_markup document =
  ResendDocument (chat_id, document, disable_notifications, reply_to, reply_markup)

let send_sticker ~chat_id ?(disable_notifications=false) ?reply_to ?reply_markup sticker ~and_then =
  SendSticker (chat_id, sticker, disable_notifications, reply_to, reply_markup, and_then)

let resend_sticker ~chat_id ?(disable_notifications=false) ?reply_to ?reply_markup sticker =
  ResendSticker (chat_id, sticker, disable_notifications, reply_to, reply_markup)
