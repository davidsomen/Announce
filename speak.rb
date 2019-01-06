#!/usr/bin/env ruby

require 'envyable'
require 'aws-sdk-polly'

Envyable.load("#{ __dir__ }/config/env.yml")

hour = Time.new.strftime("%l")
#script = "The time is #{ hour } o'clock."
script = "時間は#{ hour }時です。"

polly = Aws::Polly::Client.new(
  access_key_id: ENV["ACCESS_KEY_ID"],
  secret_access_key: ENV["SECRET_ACCESS_KEY"],
  region: 'eu-west-1'
)

response = polly.synthesize_speech({
  output_format: 'mp3',
  text: script,
  voice_id: 'Takumi'
})

temp_path = "#{ __dir__ }/temp"
bell_path = "#{ __dir__ }/bell.mp3"
time_path = "#{ temp_path }/time.mp3"

FileUtils.mkdir_p(temp_path)

IO.copy_stream(response.audio_stream, time_path)

`mpg123 #{ bell_path } 2>/dev/null && mpg123 #{ time_path } 2>/dev/null`

FileUtils.rm_rf(temp_path)
