module Ubs
  def self.login(user)
    result = student_login(username: user.ubs_no, password: Digest::MD5.hexdigest(user.password))
    return false unless result
    control_user(result)
  end

  def self.control_student(ubs_no)
    result = student_add(username: ubs_no)
    return false unless result
    control_user(result)
  end

  def self.control_user(params)
    user = User.find_by_ubs_no('o' + params['student_id'])
    return user.profile.update(crime: params['crime'].present?) if user.present?
    names = params['full_name'].split(' ')
    if names.count == 3
      first_name = names[0] + ' ' + names[1]
      last_name = names[3]
    else
      first_name = names[0]
      last_name = names[1]
    end
    user = User.create(
      first_name: first_name,
      last_name: last_name,
      password: params['student_id'],
      email: 'o' + params['student_id'] + '@ubs.com.tr',
      user_name: 'o' + params['student_id'],
      is_administrative: false,
      ubs_no: 'o' + params['student_id']
    )
    user.profile = Profile.new(
      full_name: params['full_name'],
      birthday: params['birthday'].to_datetime,
      faculty: params['faculty'],
      program: params['program'],
      program_id: params['program_id'],
      crime: params['crime'].present?
    )
  end

  def self.control_academic(tc_no)
    result = staff_info(identifyNumber: tc_no)
    return false unless result
    user = User.create(
      first_name: result['first_name'].downcase,
      last_name: result['last_name'].downcase,
      password: tc_no,
      email: result['first_name'] + '.' + result['last_name'] + '@omu.edu.tr',
      user_name: result['short_title'],
      is_administrative: false,
      idnumber: tc_no
    )
    user.profile = Profile.new(
      full_name: result['first_name'] + ' ' + result['last_name']
    )
  end

  def self.student_login(params)
    api(params.merge(query_type: 'student_login'))
  end

  def self.student_add(params)
    api(params.merge(query_type: 'student_add'))
  end

  def self.staff_info(params)
    api(params.merge(query_type: 'staff_info'))
  end

  def self.api(params)
    params = params_for(params)
    return unless params
    response_data = RestClient.post(params[:url], params)
    return if response_data.code != 200
    return if response_data.to_s == '1'
    JSON.parse(response_data)
  end

  def self.params_for(params)
    p = APP_CONFIG[:ubs_api].merge params
    case p[:query_type]
    when 'student_login'
      message = p[:client] + p[:store_key] + p[:random] + p[:username] + p[:password] + p[:query_type]
    when 'student_add'
      message = p[:client] + p[:store_key] + p[:random] + p[:username] + p[:query_type]
    when 'staff_info'
      message = p[:client] + p[:store_key] + p[:random] + p[:identifyNumber] + p[:query_type]
    else
      return nil
    end
    p[:hash] = Digest::SHA1.hexdigest(message)
    p
  end
end
