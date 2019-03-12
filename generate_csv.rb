require 'fileutils'

train_data_path = "./train/data.txt"
test_data_path = "./test/data.txt"

FileUtils.touch(train_data_path) unless FileTest.exist?(train_data_path)
FileUtils.touch(test_data_path) unless FileTest.exist?(test_data_path)

test_image_data_paths = Dir.glob("./test/**/*.jpg")
train_image_data_paths = Dir.glob("./train/**/*.jpg")

test_image_data_path_dir_name = File.dirname(test_image_data_paths.first)
index = 0

File.open(test_data_path, "w") do |f|
    test_image_data_paths.each { |path|
        if File.dirname(path) != test_image_data_path_dir_name then
            index = index + 1
        end
        f.puts("#{path} #{index}")
        test_image_data_path_dir_name = File.dirname(path)
    }
end

train_image_data_path_dir_name = File.dirname(train_image_data_paths.first)
index = 0

File.open(train_data_path, "w") do |f|
    train_image_data_paths.each { |path|
        if File.dirname(path) != train_image_data_path_dir_name then
            index = index + 1
        end
        f.puts("#{path} #{index}")
        train_image_data_path_dir_name = File.dirname(path)
    }
end
