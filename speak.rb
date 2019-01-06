#!/usr/bin/env ruby

require 'aws-sdk-polly'

hour = Time.new.strftime("%l")
#script = "The time is #{ hour } o'clock"
script = "時間は#{ hour }時です。"

polly = Aws::Polly::Client.new(
  access_key_id: 'AKIAJS26J7N6YLJJLODQ',
  secret_access_key: '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',
  region: 'eu-west-1'
)
response = polly.synthesize_speech({
  output_format: 'mp3',
  text: script,
  voice_id: 'Takumi'
})

IO.copy_stream(response.audio_stream, 'time.mp3')

`mpg123 tannoy.mp3 2>/dev/null; mpg123 time.mp3 2>/dev/null`
