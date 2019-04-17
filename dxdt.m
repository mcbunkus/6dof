functionxDot =  dxdt(t,ipl,params,controls)
%% Equations of motion
%%% ipl(1) = x = x position in inertial frame% ipl(2) = y = y position in inertial frame% ipl(3) = z = z position in inertial frame% ipl(4) = u = x velocity in vehicle frame% ipl(5) = v = y velocity in vehicle frame% ipl(6) = w = z velocity in vehicle frame% ipl(7) = p = roll rate in vehicle frame% ipl(8) = q = pitch rate in vehicle frame% ipl(9) = r = yaw rate in vehicle frame% ipl(10) = phi = roll angle in inertial frame% ipl(11) = theta = pitch angle in inertial frame% ipl(12) = psi = yaw angle in inertial frame%% Compute xDot mass = params.mass; %slugsIxx = params.Ixx;Iyy = params.Iyy;Izz = params.Izz;Ixz = params.Ixz;[rho,acousticSpeed] = getRhoBritish(-ipl(3));speed = norm(ipl(4:6));dynPress = 0.5*rho*(speed^2);alpha = atan(ipl(6)/ipl(4));beta = asin(ipl(5)/speed);vInertial = inv(transformItoV(ipl(10:12)))*ipl(4:6);force = getForce(ipl,dynPress,alpha,beta,params,controls);uDot = ipl(9)*ipl(5)-ipl(8)*ipl(6)+force(1)/mass;vDot = TBD;% v dot equationwDot = TBD;% w dot equationalphaDot = (uDot*ipl(6)-wDot*ipl(4))/(ipl(4)^2+ipl(6)^2);moment = getMoment(ipl,dynPress,alpha,alphaDot,beta,params,controls);pDot = (Izz*moment(1)+Ixz*moment(3)-(Ixz*(Iyy-Ixx-Izz)*ipl(7)+(Ixz^2+Izz*(Izz-Iyy))*ipl(9))*ipl(8))/(Ixx*Izz-Ixz^2);qDot = TBD;% q dot equationrDot = TBD;% r dot equationphiDot = ipl(7)+tan(ipl(11))*(ipl(8)*sin(ipl(10))+ipl(9)*cos(ipl(10)));thetaDot = TBD;% theta dot equationpsiDot = TBD;% psi dot equationxDot = [vInertial;uDot;vDot;wDot;pDot;qDot;rDot;phiDot;thetaDot;psiDot];end