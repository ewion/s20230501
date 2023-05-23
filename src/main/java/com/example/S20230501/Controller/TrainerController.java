package com.example.S20230501.Controller;

import com.example.S20230501.Service.TrainerService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Slf4j
@AllArgsConstructor
public class TrainerController {

    private final TrainerService TS;

    @GetMapping("trainer_main")
    public String trainer_main(Model model) {
        String trainerId = "oWGIE@example.com";
        List<String> trainersMemberList = TS.getTrainersMemberList(trainerId);
        model.addAttribute("trainersMemberList", trainersMemberList);
        return "trainer_main";
    }
    @GetMapping("trainer_management")
    public String trainer_management(Model model) {

        return "trainer_management";
    }
}
