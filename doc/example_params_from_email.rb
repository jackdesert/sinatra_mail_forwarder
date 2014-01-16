params =
{"plain"=>
  "8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888\n",
 "html"=>"",
 "reply_plain"=>"",
 "headers"=>
  {"Return-Path"=>"jworky@gmail.com",
   "Received"=>
    {"0"=>
      "by mail-bk0-f47.google.com with SMTP id mx12so864413bkb.6 for <063a03f83ce45c9031cf@cloudmailin.net>; Wed, 15 Jan 2014 12:0",
     "1"=> "by 10.204.248.7 with SMTP id me7csp323561bkb; Wed, 15 Jan 2014 12:01:25 -0800",
     "2"=>"by 10.194.77.4 with HTTP; Wed, 15 Jan 2014 12:01:25 -0800"},
   "Date"=>"Wed, 15 Jan 2014 12:01:25 -0800",
   "From"=>"Jack Desert <jworky@gmail.com>",
   "To"=>"Jack at Work <jackdesert@gmail.com>",
   "Message-ID"=>
    "<CAE7a6LH-Z3DA3j9dKHvt4-M6U6KZ6DNfBB6MH+7U0S8hFtR=_w@mail.gmail.com>",
   "Subject"=>"eight",
   "Mime-Version"=>"1.0",
   "X-Received"=>
    {"0"=>
      "by 10.204.248.72 with SMTP id mf8mr1900670bkb.56.1389816086159; Wed, 15 Jan 2014 12:01:26 -0800 (PST)",
     "1"=>      "from mr.google.com ([10.194.77.7]) by 10.194.77.7 with SMTP id o7mr4277781wjw.35.1389816085400 (num_hops = 1); Wed, 15 Jan",
     "2"=>      "by 10.194.77.7 with SMTP id o7mr4277781wjw.35.1389816085395; Wed, 15 Jan 2014 12:01:25 -0800 (PST)"},
   "X-Forwarded-To"=>"063a03f83ce45c9031cf@cloudmailin.net",
   "X-Forwarded-For"=>
    "jackdesert@gmail.com 063a03f83ce45c9031cf@cloudmailin.net",
   "Delivered-To"=>"jackdesert@gmail.com",
   "Received-SPF"=>
    "pass (google.com: domain of jworky@gmail.com designates 10.194.77.7 as permitted sender) client-ip=10.194.77.7",
   "Authentication-Results"=>
    "mr.google.com; spf=pass (google.com: domain of jworky@gmail.com designates 10.194.77.7 as permitted sender) smtp.mail=jworky@",
   "DKIM-Signature"=>
    "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113; h=mime-version:date:message-id:subject:from:to:content-type; b",
 "envelope"=>
  {"to"=>"063a03f83ce45c9031cf@cloudmailin.net",
   "recipients"=>{"0"=>"063a03f83ce45c9031cf@cloudmailin.net"},
   "from"=>"jackdesert+caf_=063a03f83ce45c9031cf=cloudmailin.net@gmail.com",
   "helo_domain"=>"mail-bk0-f47.google.com",
   "remote_ip"=>"209.85.214.47",
   "spf"=>{"result"=>"neutral", "domain"=>"gmail.com"}}}}
require 'pry'
binding.pry
