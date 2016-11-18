# club_category , club , club_settings , club_period , user ,
# event_category , role , roles_user , system_announcement , announcement
# modellerine seed verisi eklenmiştir.

@academic_period = AcademicPeriod.create(name: '2015-2016', is_active: true)

# club_category
@club_category = ClubCategory.create([{ name: 'Sosyal Topluluk' }, { name: 'Mesleki Topluluk' }])

# eventCategory
EventCategory.create([{ name: 'Eğitim' }, { name: 'Festival' }, { name: 'Gezi' }, { name: 'Film-Gösteri-Şölen' }])
EventCategory.create([{ name: 'Konferans' }, { name: 'Kongre' }, { name: 'Konser-Dinleti' }, { name: 'Çalıştay' }])
EventCategory.create([{ name: 'Panel' }, { name: 'Seminer' }, { name: 'Sempozyum' }, { name: 'Sergi' }])
EventCategory.create([{ name: 'Söyleşi' }, { name: 'Kurs' }, { name: 'Yarışma' }, { name: 'Spor' }])
EventCategory.create([{ name: 'Yardım Kampanyası' }, { name: 'Topluluk Toplantısı' }, { name: 'Anma' }, { name: 'Ödül Töreni' }])

# club
@club = Club.create(name: 'Siber Güvenlik Topluluğu', short_name: 'siber-guvenlik-toplulugu', description: 'Topluluk üniversite öğrencilerinde siber güvenlik farkındalığı sağlamak temel amacıdır.', is_active: true, club_category_id: ClubCategory.find_by_name('Sosyal Topluluk').id, creation_date: DateTime.now)

# club-period
@club_period = ClubPeriod.create(club_id: @club.id, academic_period_id: @academic_period.id)

# roller
@role_type_advisor = RoleType.create(name: 'Akademik Danışman')
@role_type_advisor_y = RoleType.create(name: 'Akademik Danışman Yardımcısı')
@role_type_president = RoleType.create(name: 'Başkan')
@role_type_member = RoleType.create(name: 'Üye')
@role_type_admin = RoleType.create(name: 'Admin')

# admin kullanıcı
@user = User.create(first_name: 'Admin', last_name: 'Kullanıcı', user_name: 'admin', email: 'admin@tbs.com', password: 'admin123', is_administrative: true, idnumber: '00000000000')
@rol_admin = Role.create(user_id: @user.id, role_type_id: @role_type_admin.id)

# announcement
Announcement.create(club_period_id: @club_period.id, title: 'Siber g. Duyuru 1', content: 'test', is_view: true, is_advisor_confirmation: true)
Announcement.create(club_period_id: @club_period.id, title: 'Siber g. Duyuru 2', content: 'testtttt', is_view: true, is_advisor_confirmation: false)
Announcement.create(club_period_id: @club_period.id, title: 'Siber g. Duyuru 3', content: 'testaaaaaa', is_view: false, is_advisor_confirmation: true)

# club-setting
ClubSetting.create(club_id: @club.id, max_user: 150)

# users
@user_advisor = User.create(first_name: 'Akademik Danışman', idnumber: '12345678912', last_name: 'Siber G.', user_name: 'advisor-siber', email: 'advisor-siber@tbs.com', password: 'advisor123', is_academic: true, degree: 'Prof. Dr.')
@user_president = User.create(first_name: 'Başkan', last_name: 'Siber G.', ubs_no: 'o11111111', user_name: 'president-siber', email: 'president-siber@tbs.com', password: 'president123', program_code: '2728')
@user_member = User.create(first_name: 'Üye', last_name: 'Siber G.', ubs_no: 'o22222222', user_name: 'member-siber', email: 'member-siber@tbs.com', password: 'member123', program_code: '2728')

# club roles
Role.create(user_id: @user_advisor.id, club_period_id: @club_period.id, role_type_id: @role_type_advisor.id)
Role.create(user_id: @user_president.id, club_period_id: @club_period.id, role_type_id: @role_type_president.id)
Role.create(user_id: @user_member.id, club_period_id: @club_period.id, role_type_id: @role_type_member.id)

# club
@club = Club.create(name: 'Bisiklet Topluluğu', short_name: 'bisiklet-toplulugu', description: 'Bisikletin önemini ve yaygınlaşmasını amaçlamış bir topluluktur.', is_active: true, club_category_id: ClubCategory.find_by_name('Sosyal Topluluk').id, creation_date: DateTime.now)

# club-period
@club_period = ClubPeriod.create(club_id: @club.id, academic_period_id: @academic_period.id)

# announcement
Announcement.create(club_period_id: @club_period.id, title: 'Bisiklet. Duyuru 1', content: 'test', is_view: true, is_advisor_confirmation: true)
Announcement.create(club_period_id: @club_period.id, title: 'Bisiklet. Duyuru 2', content: 'testtttt', is_view: true, is_advisor_confirmation: false)
Announcement.create(club_period_id: @club_period.id, title: 'Bisiklet. Duyuru 3', content: 'testaaaaaa', is_view: false, is_advisor_confirmation: true)

# club-setting
@club_setting = ClubSetting.create(club_id: @club.id, max_user: 150)

# users
@user_advisor = User.create(first_name: 'Akademik Danışman', last_name: 'Bisiklet.', idnumber: '98765432198', user_name: 'advisor-bisiklet', email: 'advisor-bisiklet@tbs.com', password: 'advisor123', is_academic: true, degree: 'Prof. Dr.')
@user_president = User.create(first_name: 'Başkan', last_name: 'Bisiklet.', ubs_no: 'o33333333', user_name: 'president-bisiklet', email: 'president-bisiklet@tbs.com', password: 'president123', program_code: '2728')
@user_member = User.create(first_name: 'Üye', last_name: 'Bisiklet.', ubs_no: 'o44444444', user_name: 'member-bisiklet', email: 'member-bisiklet@tbs.com', password: 'member123', program_code: '2728')

# club roles
Role.create(user_id: @user_advisor.id, club_period_id: @club_period.id, role_type_id: @role_type_advisor.id)
Role.create(user_id: @user_president.id, club_period_id: @club_period.id, role_type_id: @role_type_president.id)
Role.create(user_id: @user_member.id, club_period_id: @club_period.id, role_type_id: @role_type_member.id)

# System announcement
SystemAnnouncement.create(title: 'Duyuru 1', content: 'bu test amaçlı oluşturulmuş bir duyurudur.', is_view: true)
SystemAnnouncement.create(title: 'Duyuru 2', content: 'bu test amaçlı oluşturulmuş 2. duyurudur.', is_view: false)
SystemAnnouncement.create(title: 'Duyuru 3', content: 'bu test amaçlı oluşturulmuş 3. duyurudur.', is_view: true)
SystemAnnouncement.create(title: 'Duyuru 4', content: 'bu test amaçlı oluşturulmuş 4. duyurudur.', is_view: true)
SystemAnnouncement.create(title: 'Duyuru 5', content: 'bu test amaçlı oluşturulmuş 5. duyurudur.', is_view: true)

# Event Status
EventStatus.create(status: 'SKS Admin Onayı Bekleniyor')
EventStatus.create(status: 'SKS Admin Onayladı')
EventStatus.create(status: 'SKS Admin Onaylamadı')
EventStatus.create(status: 'Akademik Danışman Onayı Bekleniyor')
EventStatus.create(status: 'Akademik Danışman Onayladı')
EventStatus.create(status: 'Akademik Danışman Onaylamadı')

# New Users
User.create(email: 'member1@tbs.com', password: 'member123', user_name: 'member1', ubs_no: 'o1', first_name: 'member1', last_name: '')
User.create(email: 'member2@tbs.com', password: 'member123', user_name: 'member2', ubs_no: 'o2', first_name: 'member2', last_name: '')
User.create(email: 'member3@tbs.com', password: 'member123', user_name: 'member3', ubs_no: 'o3', first_name: 'member3', last_name: '')
User.create(email: 'member4@tbs.com', password: 'member123', user_name: 'member4', ubs_no: 'o4', first_name: 'member4', last_name: '')
User.create(email: 'member5@tbs.com', password: 'member123', user_name: 'member5', ubs_no: 'o5', first_name: 'member5', last_name: '')
User.create(email: 'member6@tbs.com', password: 'member123', user_name: 'member6', ubs_no: 'o6', first_name: 'member6', last_name: '')
User.create(email: 'member7@tbs.com', password: 'member123', user_name: 'member7', ubs_no: 'o7', first_name: 'member7', last_name: '')
User.create(email: 'member8@tbs.com', password: 'member123', user_name: 'member8', ubs_no: 'o8', first_name: 'member8', last_name: '')
User.create(email: 'member9@tbs.com', password: 'member123', user_name: 'member9', ubs_no: 'o9', first_name: 'member9', last_name: '')
User.create(email: 'member10@tbs.com', password: 'member123', user_name: 'member10', ubs_no: 'o10', first_name: 'member10', last_name: '')
User.create(email: 'member11@tbs.com', password: 'member123', user_name: 'member11', ubs_no: 'o11', first_name: 'member11', last_name: '')
User.create(email: 'member12@tbs.com', password: 'member123', user_name: 'member12', ubs_no: 'o12', first_name: 'member12', last_name: '')
User.create(email: 'member13@tbs.com', password: 'member123', user_name: 'member13', ubs_no: 'o13', first_name: 'member13', last_name: '')
User.create(email: 'member14@tbs.com', password: 'member123', user_name: 'member14', ubs_no: 'o14', first_name: 'member14', last_name: '')
User.create(email: 'member15@tbs.com', password: 'member123', user_name: 'member15', ubs_no: 'o15', first_name: 'member15', last_name: '')
User.create(email: 'member16@tbs.com', password: 'member123', user_name: 'member16', ubs_no: 'o16', first_name: 'member16', last_name: '')
User.create(email: 'member17@tbs.com', password: 'member123', user_name: 'member17', ubs_no: 'o17', first_name: 'member17', last_name: '')
User.create(email: 'member18@tbs.com', password: 'member123', user_name: 'member18', ubs_no: 'o18', first_name: 'member18', last_name: '')
User.create(email: 'member19@tbs.com', password: 'member123', user_name: 'member19', ubs_no: 'o19', first_name: 'member19', last_name: '')
User.create(email: 'member20@tbs.com', password: 'member123', user_name: 'member20', ubs_no: 'o20', first_name: 'member20', last_name: '')
User.create(email: 'member21@tbs.com', password: 'member123', user_name: 'member21', ubs_no: 'o21', first_name: 'member21', last_name: '')
User.create(email: 'member22@tbs.com', password: 'member123', user_name: 'member22', ubs_no: 'o22', first_name: 'member22', last_name: '')
User.create(email: 'member23@tbs.com', password: 'member123', user_name: 'member23', ubs_no: 'o23', first_name: 'member23', last_name: '')
User.create(email: 'ember24@tbs.com', password: 'member123', user_name: 'member24', ubs_no: 'o24', first_name: 'member24', last_name: '')
User.create(email: 'member25@tbs.com', password: 'member123', user_name: 'member25', ubs_no: 'o25', first_name: 'member25', last_name: '')
User.create(email: 'member26@tbs.com', password: 'member123', user_name: 'member26', ubs_no: 'o26', first_name: 'member26', last_name: '')
User.create(email: 'member27@tbs.com', password: 'member123', user_name: 'member27', ubs_no: 'o27', first_name: 'member27', last_name: '')
User.create(email: 'member28@tbs.com', password: 'member123', user_name: 'member28', ubs_no: 'o28', first_name: 'member28', last_name: '')
User.create(email: 'member29@tbs.com', password: 'member123', user_name: 'member29', ubs_no: 'o29', first_name: 'member29', last_name: '')
User.create(email: 'member30@tbs.com', password: 'member123', user_name: 'member30', ubs_no: 'o30', first_name: 'member30', last_name: '')
User.create(email: 'member31@tbs.com', password: 'member123', user_name: 'member31', ubs_no: 'o31', first_name: 'member31', last_name: '')
User.create(email: 'member32@tbs.com', password: 'member123', user_name: 'member32', ubs_no: 'o32', first_name: 'member32', last_name: '')
User.create(email: 'member33@tbs.com', password: 'member123', user_name: 'member33', ubs_no: 'o33', first_name: 'member33', last_name: '')
User.create(email: 'member34@tbs.com', password: 'member123', user_name: 'member34', ubs_no: 'o34', first_name: 'member34', last_name: '')
User.create(email: 'member35@tbs.com', password: 'member123', user_name: 'member35', ubs_no: 'o35', first_name: 'member35', last_name: '')
User.create(email: 'member36@tbs.com', password: 'member123', user_name: 'member36', ubs_no: 'o36', first_name: 'member36', last_name: '')
User.create(email: 'member37@tbs.com', password: 'member123', user_name: 'member37', ubs_no: 'o37', first_name: 'member37', last_name: '')
User.create(email: 'member39@tbs.com', password: 'member123', user_name: 'member39', ubs_no: 'o39', first_name: 'member39', last_name: '')
User.create(email: 'member40@tbs.com', password: 'member123', user_name: 'member40', ubs_no: 'o40', first_name: 'member40', last_name: '')
User.create(email: 'member38@tbs.com', password: 'member123', user_name: 'member38', ubs_no: 'o38', first_name: 'member38', last_name: '')
User.create(email: 'member41@tbs.com', password: 'member123', user_name: 'member41', ubs_no: 'o41', first_name: 'member41', last_name: '')
User.create(email: 'member42@tbs.com', password: 'member123', user_name: 'member42', ubs_no: 'o42', first_name: 'member42', last_name: '')
User.create(email: 'member43@tbs.com', password: 'member123', user_name: 'member43', ubs_no: 'o43', first_name: 'member43', last_name: '')
User.create(email: 'member44@tbs.com', password: 'member123', user_name: 'member44', ubs_no: 'o44', first_name: 'member44', last_name: '')
User.create(email: 'member45@tbs.com', password: 'member123', user_name: 'member45', ubs_no: 'o45', first_name: 'member45', last_name: '')
User.create(email: 'member46@tbs.com', password: 'member123', user_name: 'member46', ubs_no: 'o46', first_name: 'member46', last_name: '')
User.create(email: 'member47@tbs.com', password: 'member123', user_name: 'member47', ubs_no: 'o47', first_name: 'member47', last_name: '')
User.create(email: 'member48@tbs.com', password: 'member123', user_name: 'member48', ubs_no: 'o48', first_name: 'member48', last_name: '')
User.create(email: 'member49@tbs.com', password: 'member123', user_name: 'member49', ubs_no: 'o49', first_name: 'member49', last_name: '')
User.create(email: 'member50@tbs.com', password: 'member123', user_name: 'member50', ubs_no: 'o50', first_name: 'member50', last_name: '')
