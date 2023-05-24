package com.example.S20230501.Controller;

import com.example.S20230501.Model.HT_USERS_DATA;
import com.example.S20230501.Model.HT_USERS_DATA_ljy;
import com.example.S20230501.Service.TrainerService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
@AllArgsConstructor
public class TrainerController {

    private final TrainerService TS;

    @GetMapping("trainer_main")
    public String trainer_main(Model model) {
        // 로그인한 트레이너 ID추출
        String trainerId = "oWGIE@example.com";

        //오늘 날짜 추출
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
        String today = LocalDate.now().format(formatter);
        System.out.println("오늘 날짜 = "+today);

        // 트레이너 ID로 트레이너 정보 추출
        HT_USERS_DATA trainerInfo = TS.getTrainerInfo(trainerId);

        //구독기간이 진행중인 트레이너 구독 회원 추출
        HT_USERS_DATA_ljy subUsers = new HT_USERS_DATA_ljy();
        subUsers.setTrainer_id(trainerId);
        subUsers.setToday(today);
        List<HT_USERS_DATA_ljy> trainersMemberList = TS.getTrainersMemberList(subUsers);
        System.out.println("trainersMemberList = "+trainersMemberList);
        model.addAttribute("trainerInfo", trainerInfo);
        model.addAttribute("trainersMemberList", trainersMemberList);
        System.out.println("trainerId = "+trainerId);
        return "trainer_main";
    }
    @GetMapping("trainer_management")
    public String trainer_management(Model model) {

        return "trainer_management";
    }
}
